<html>
<head>
<title>Map</title>
<style type="text/css">
table {
  border-width: 0;
  border-collapse: collapse;
}
table, tr, td {
% if border:
  border-width: 1;
  border-color: red;
  border-style: solid;
% else:
  border-width: 0;
% end
  margin: 0;
  padding: 0;
}
img {
  margin: 0;
  padding: 0;
}
</style>
</head>
<body>
<table>
% for y in Y:
<tr>
% for x in X:
<td><img src="{{ base_url }}/{{ map_type }}/{{ z }}/{{ x }}/{{ y }}.png"></td>
% end
</tr>
% end
</table>

<div>
<span style="font-size: x-small; padding: 2px; border: 1px solid black">国土地理院 <a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">地理院タイル</a></span>
</div>

</body>
</html>
