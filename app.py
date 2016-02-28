# -*- coding: utf-8 -*-
import os
from bottle import route, request, view, template, run, Response

MAX_LENGTH = 100
TYPES = {
    'std': {'name': u'標準地図', 'z_min': 2, 'z_max': 18},
    'pale': {'name': u'淡色地図', 'z_min': 12, 'z_max': 18},
    'blank': {'name': u'白地図', 'z_min': 5, 'z_max': 14},
    'english': {'name': u'英語', 'z_min': 5, 'z_max': 11},
    'relief': {'name': u'色別標高図', 'z_min': 5, 'z_max': 15},
    'ort': {'name': u'写真', 'z_min': 2, 'z_max': 18},
    'ort_old10': {'name': u'空中写真（1961～1964年）', 'z_min': 10, 'z_max': 17},
    'ort_USA10': {'name': u'空中写真（1945～1950年）', 'z_min': 10, 'z_max': 17},
    'airphoto': {'name': u'簡易空中写真（2004年～）', 'z_min': 15, 'z_max': 18},
}
BASE_URL = 'http://cyberjapandata.gsi.go.jp/xyz'

@route('/')
@view('top')
def hello():
    return dict(map_types=TYPES)

@route('/show')
@view('map')
def show():
    if request.query.map_type not in TYPES:
        Response.status = 400
        return 'unknown type'
    (tl_x, tl_y) = request.query.tl.split(',')
    (br_x, br_y) = request.query.br.split(',')
    z, message = is_valid_zoom_level(request.query.map_type, int(request.query.z))
    if z is None:
        Response.status = 400
        return message
    max = calc_max(z)
    x = mklist(int(tl_x), int(br_x), max)
    y = mklist(int(tl_y), int(br_y), max)
    return dict(X=x, Y=y, z=z, map_type=request.query.map_type,
                border=request.query.border,
                base_url=BASE_URL)


def is_valid_zoom_level(map_type, level):
    if (level < TYPES[map_type]['z_min'] or TYPES[map_type]['z_max'] < level):
        return (None, 'unsupported zoom level(%s) for %s' % (level, map_type))

    return level, None


def calc_max(z):
    return 2 ** z


def mklist(a, b, max):
    if a > max or b > max:
        return None
    if (a > b):
        c = a
        a = b
        b = c
    if (b - a > MAX_LENGTH):
        return None
    return range(a,b+1)

if __name__ == '__main__':
    if os.getenv("DYNO") is None:       
        run(host="localhost", port=int(os.environ.get("PORT",5000)), debug=True, reloader=True)
    else:
        run(host="0.0.0.0", port=int(os.environ.get("PORT",5000)))
