<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>별점</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:top;background:url('star.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:100px;height:0px;padding:0px;line-height:20px;}
.star-input>.input{display:inline-block;width:100px;background-size:100px;height:19.5px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:0;height:0;padding:19.5px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 100px; background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:10px;z-index:10;}
.star-input>.input>label[for="p2"]{width:20px;z-index:9;}
.star-input>.input>label[for="p3"]{width:30px;z-index:8;}
.star-input>.input>label[for="p4"]{width:40px;z-index:7;}
.star-input>.input>label[for="p5"]{width:50px;z-index:6;}
.star-input>.input>label[for="p6"]{width:60px;z-index:5;}
.star-input>.input>label[for="p7"]{width:70px;z-index:4;}
.star-input>.input>label[for="p8"]{width:80px;z-index:3;}
.star-input>.input>label[for="p9"]{width:90px;z-index:2;}
.star-input>.input>label[for="p10"]{width:100px;z-index:1;}
.star-input>output{display:inline-block;width:15px; font-size:18px;text-align:right; vertical-align:top;}
</style>

</head>

<body>

<span class="star-input">
   <span class="input">
       <input type="radio" name="star-input" value="1" id="p1">
       <label for="p1">1</label>
       <input type="radio" name="star-input" value="2" id="p2">
       <label for="p2">2</label>
       <input type="radio" name="star-input" value="3" id="p3">
       <label for="p3">3</label>
       <input type="radio" name="star-input" value="4" id="p4">
       <label for="p4">4</label>
       <input type="radio" name="star-input" value="5" id="p5">
       <label for="p5">5</label>
       <input type="radio" name="star-input" value="6" id="p6">
       <label for="p6">6</label>
       <input type="radio" name="star-input" value="7" id="p7">
       <label for="p7">7</label>
       <input type="radio" name="star-input" value="8" id="p8">
       <label for="p8">8</label>
       <input type="radio" name="star-input" value="9" id="p9">
       <label for="p9">9</label>
       <input type="radio" name="star-input" value="10" id="p10">
       <label for="p10">10</label>
     </span>
     <output for="star-input"><b>0</b>점</output>                  
</span>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/star.js"></script>
</body>
</html>