<html lang=ja>
<head>
<title>地図ならべ</title>
<script type="text/javascript">
function setvalue (tl, br, z) {
    document.forms.main.tl.value = tl;
    document.forms.main.br.value = br;
    document.forms.main.z.value = z;
}
</script>
<style type="text/css">
fieldset {
    float: left;
}
li {
    cursor: pointer;
}
li:hover {
    color: red;
}
ul {
    margin-top: 0;
}
</style>
</head>
<body>
<div>
<a href="http://www.gsi.go.jp/">国土地理院</a>提供の<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">地理院タイル</a>画像を並べて表示します。<a href="http://www.gsi.go.jp/kikakuchousei/kikakuchousei40182.html" target="_blank">国土地理院コンテンツ利用規約</a><br>
<br>
「<a href="http://maps.gsi.go.jp/development/tileCoordCheck.html" target="_blank">タイル座標確認ページ</a>」で表示したいズームレベルと範囲を決めて、左上のX,Y座標、右下のX,Y座標を入力して「描画」をクリックすると指定の地図画像を並べて表示します。
「クイック入力」にある都道府県名などをクリックすると座標が入力されます。カッコ内の数字はズームレベルです。
</div>

<div style="margin-top: 1em">
<form action="/show" name="main" target="_blank">
<fieldset>
<legend>地図種別:</legend>
<select name="map_type">
% for map_type in map_types:
<option value="{{ map_type }}">{{ map_types[map_type]['name'] }} (Zoom {{ map_types[map_type]['z_min'] }}..{{ map_types[map_type]['z_max'] }})</option>
% end
</select>
</fieldset>
<fieldset>
<legend>Zoom Level:</legend>
<select name="z">
% for i in range(2,19):
<option value="{{ i }}">{{ i }}</option>
% end
</select>
</fieldset>
<fieldset>
<legend>TopLeft:</legend>
<input type="text" name="tl" size="8">
</fieldset>
<fieldset>
<legend>BottomRight:</legend>
<input type="text" name="br" size="8">
</fieldset>
<fieldset>
<legend>Border:</legend>
<input type="checkbox" name="border" value="1">
</fieldset>
<br style="clear: both">
<button type="submit">描画</button>
</form>


</div>

<h3>クイック入力</h3>
<div>
<div style="float: left;">
<ul>
  <li onClick="setvalue('27,11', '29,13', 5)">日本列島(5)</li>
  <li onClick="setvalue('54,22', '58,27', 6)">日本列島(6)</li>
  <li onClick="setvalue('29103,12901', '29105,12903', 15)">皇居付近(15)</li>
  <li onClick="setvalue('232796,103216', '232800,103222', 18)">新宿駅付近(18)</li>
  <li onClick="setvalue('116411,51635', '116414,51639', 17)">品川駅付近(17)</li>
  <li onClick="setvalue('116397,51621', '116401,51624', 17)">渋谷駅付近(17)</li>
  <li onClick="setvalue('116425,51594', '116428,51599', 17)">上野駅付近(17)</li>
  <li onClick="setvalue('227,95', '229,98', 8)">東北地方(8)</li>
  <li onClick="setvalue('224,98', '227,101', 8)">北陸4県(8)</li>
  <li onClick="setvalue('448,198', '451,202', 9)">北陸3県(9)</li>
  <li onClick="setvalue('227,98', '227,101', 8)">中部地方(8)</li>
  <li onClick="setvalue('113,45', '116,47', 7)">01 北海道(7)</li>
  <li onClick="setvalue('454,190', '457,193', 9)">02 青森県(9)</li>
  <li onClick="setvalue('456,193', '458,196', 9)">03 岩手県(9)</li>
  <li onClick="setvalue('454,192', '456,195', 9)">05 秋田県(9)</li>
  <li onClick="setvalue('454,195', '457,197', 9)">06 山形県、04 宮城県(9)</li>
  <li onClick="setvalue('453,197', '456,199', 9)">07 福島県(9)</li>
  <li onClick="setvalue('451,196', '454,199', 9)">15 新潟県(9)</li>
  <li onClick="setvalue('452,199', '456,201', 9)">10 群馬県、09 栃木県、08 茨城県、11 埼玉県(9)</li>
  <li onClick="setvalue('906,401', '909,402', 10)">11 埼玉県(10)</li>
  <li onClick="setvalue('909,402', '912,405', 10)">12 千葉県(10)</li>
  <li onClick="setvalue('1814,804', '1819,807', 11)">13 東京都(11)</li>
  <li onClick="setvalue('1814,806', '1819,810', 11)">14 神奈川県(11)</li>
  <li onClick="setvalue('901,398', '903,401', 10)">16 富山県(10)</li>
  <li onClick="setvalue('899,396', '902,401', 10)">17 石川県(10)</li>
  <li onClick="setvalue('897,401', '901,404', 10)">18 福井県(10)</li>
  <li onClick="setvalue('905,402', '907,405', 10)">19 山梨県(10)</li>
  <li onClick="setvalue('902,398', '906,404', 10)">20 長野県(10)</li>
  <li onClick="setvalue('899,400', '903,405', 10)">21 岐阜県(10)</li>
  <li onClick="setvalue('903,403', '907,407', 10)">22 静岡県(10)</li>
</ul>
</div>
<div style="float: left;">
<ul>
  <li onClick="setvalue('900,404', '904,407', 10)">23 愛知県(10)</li>
  <li onClick="setvalue('898,404', '901,410', 10)">24 三重県(10)</li>
  <li onClick="setvalue('898,403', '900,406', 10)">25 滋賀県(10)</li>
  <li onClick="setvalue('895,402', '898,406', 10)">26 京都府(10)</li>
  <li onClick="setvalue('1792,810', '1796,816', 11)">27 大阪府(11)</li>
  <li onClick="setvalue('893,403', '897,408', 10)">28 兵庫県(10)</li>
  <li onClick="setvalue('897,406', '899,409', 10)">29 奈良県(10)</li>
  <li onClick="setvalue('896,407', '898,411', 10)">30 和歌山県(10)</li>
  <li onClick="setvalue('890,403', '894,405', 10)">31 鳥取県(10)</li>
  <li onClick="setvalue('886,400', '891,408', 10)">32 島根県(10)</li>
  <li onClick="setvalue('891,404', '894,407', 10)">33 岡山県(10)</li>
  <li onClick="setvalue('887,405', '891,408', 10)">34 広島県(10)</li>
  <li onClick="setvalue('884,406', '888,409', 10)">35 山口県(10)</li>
  <li onClick="setvalue('892,408', '895,410', 10)">36 徳島県(10)</li>
  <li onClick="setvalue('1783,815', '1789,818', 11)">37 香川県(10)</li>
  <li onClick="setvalue('887,408', '892,412', 10)">38 愛媛県(10)</li>
  <li onClick="setvalue('889,409', '894,413', 10)">39 高知県(10)</li>
  <li onClick="setvalue('881,409', '885,412', 10)">40 福岡県(10)</li>
  <li onClick="setvalue('881,410', '883,412', 10)">41 佐賀県(10)</li>
  <li onClick="setvalue('877,406', '882,413', 10)">42 長崎県(10)</li>
  <li onClick="setvalue('881,411', '885,415', 10)">43 熊本県(10)</li>
  <li onClick="setvalue('884,409', '887,413', 10)">44 大分県(10)</li>
  <li onClick="setvalue('883,413', '887,417', 10)">45 宮崎県(10)</li>
  <li onClick="setvalue('880,415', '885,422', 10)">46 鹿児島県(10)</li>
  <li onClick="setvalue('107,53', '110,55', 7)">47 沖縄県(7)</li>
</ul>
</div>
</div>
</body>
</html>
