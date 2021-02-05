<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Organization Chart Plugin</title>
  <link rel="icon" href="img/logo.png">
  <link rel="stylesheet" href="css/jquery.orgchart.css">
  <link rel="stylesheet" href="css/style.css">
  <style>
  html,body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

body {
  font-family: Arial;
  color: #333333;
}

#chart-container {
  position: relative;
  display: inline-block;
  top: 10px;
  left: 10px;
  height: 420px;
  width: calc(100% - 24px);
  border: 2px dashed #aaa;
  border-radius: 5px;
  overflow: auto;
  text-align: center;
}
  </style>
</head>
<body>
  <div id="chart-container"></div>

  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.orgchart.js"></script>
  <script type="text/javascript">
    $(function() {

    var datascource = {
      'name': 'Lao Lao',
      'title': 'general manager',
      'children': [
        { 'name': 'Bo Miao', 'title': 'department manager',
          'children': [
            { 'name': 'Ren Wu', 'title': 'senior engineer' },
            { 'name': 'Li Xin', 'title': 'senior engineer' }
          ]
        },
        { 'name': 'Su Miao', 'title': 'department manager' },
        { 'name': 'Hong Miao', 'title': 'department manager',
          'children': [
            { 'name': 'Xing An', 'title': 'senior engineer' },
            { 'name': 'Yi Dian', 'title': 'senior engineer' }
          ]
        }
      ]
    };

    $('#chart-container').orgchart({
      'data' : datascource,
      'nodeContent': 'title',
      'toggleSiblingsResp': true
    });

  });
  </script>
  </body>
</html>