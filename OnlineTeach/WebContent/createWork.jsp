<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>课堂练习创建</title>
<link rel="stylesheet" href="css/style.css" />
</head>

<body>

<jsp:include page="include/header.jsp" />

<div class="site">
    <div class="container">
        <div class="courseTimeLabel">
            <div class="courseTimeLabelItem pullleft courseTimeLabelItemOne">上一次课：2013-4-12 星期三 上午 3-4节</div>
            <h4 class="courseTimeLabelItem pullleft courseTimeLabelItemTwo">毛泽东思想</h4>
            <div class="courseTimeLabelItem pullright courseTimeLabelItemThree">下一次课：2013-4-14 星期五 下午 7-8节</div>
        </div>
		<div class="firstLR">
		  <div class="mainbox LRleft pullleft">
		    <div class="cwCoursingTitle">
            	<div class="cwCoursingTitleTxt">正在进行的课堂练习</div>
            </div>
		    <div class="cwCoursing">
            	<ul>
            		<li><a href="#">一部分是对马克思列宁主义的创造性的发展...</a></li>
            		<li><a href="#">一部分是毛泽东思想的活的灵魂</a></li>
            		<li><a href="#">对于马克思主义创造性的发展主要是指新民...</a></li>
            		<li><a href="#">毛泽东思想的理论体系概括为</a></li>
            		<li><a href="#">关于现代世界情况及中国国情的分析</a></li>
            		<li><a href="#">关于新民主主义的理论与政策</a></li>
            		<li><a href="#">关于解放农民的理论与政策</a></li>
            		<li><a href="#">关于革命统一战线的理论与政策</a></li>
            		<li><a href="#">关于革命战争的理论与政策</a></li>
            		<li><a href="#">关于革命根据地的理论与政策</a></li>
            	</ul>
            </div>
		  </div><!-- End of LRleft -->
		  <div class="mainbox LRRight pullright">
		    <div class="workLabelUp">
            	<div class="pullleft cacbDiv">
	                <input type="checkbox" name="checkAllCheckbox" class="checkAllCheckbox" id="checkAllCheckbox" onMouseOver="pmt('checkAllCheckbox', '全选/取消全选');" onMouseOut="erasePmt();" onChange="slctChange();">
                </div>
                <div class="pullleft flatbtn wluBtn" id="createCourseButton" onMouseOver="pmt('createCourseButton', '创建新的练习');" onMouseOut="erasePmt();" onClick="showCreateWork();">
                	<div class="createCourseButtonImg" onClick="showCreateWork();"></div>
                </div>
                <div class="pullleft flatbtn wluBtn" id="archiveButton" onMouseOver="pmt('archiveButton', '存档');" onMouseOut="erasePmt();">
                	<div class="archiveButtonImg"></div>
                </div>
                <div class="pullleft flatbtn wluBtn" id="delButton" onMouseOver="pmt('delButton', '删除');" onMouseOut="erasePmt();">
                	<div class="delButtonImg"></div>
                </div>
                <div class="pullleft flatbtn wluBtn shareButton" id="shareButton" onMouseOver="pmt('shareButton', '分享给其他老师啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊');" onMouseOut="erasePmt();">
                	<div class="shareButtonImg"></div>
                </div>
                <div class="clearboth"></div>
            </div>
            <div class="workLabelDown">
            	<div class="workLabelDownTit" id="workLabelDownTit">我的题库</div>
                <div class="workLabelDownContainer">
 					<jsp:include page="include/newExerciseSnippet.jsp" />
                    <div class="wldcListBox" id="wldcListBox">
                        <ul id="wldcListBoxUl">
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci1" onMouseOver="pmt('wldci1', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn1" onMouseOver="pmt('wldcaacAnswerBtn1', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn1" onMouseOver="pmt('wldcaacDetailBtn1', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci2" onMouseOver="pmt('wldci2', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn2" onMouseOver="pmt('wldcaacAnswerBtn2', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn2" onMouseOver="pmt('wldcaacDetailBtn2', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci3" onMouseOver="pmt('wldci3', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn3" onMouseOver="pmt('wldcaacAnswerBtn3', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn3" onMouseOver="pmt('wldcaacDetailBtn3', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci4" onMouseOver="pmt('wldci4', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn4" onMouseOver="pmt('wldcaacAnswerBtn4', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn4" onMouseOver="pmt('wldcaacDetailBtn4', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci5" onMouseOver="pmt('wldci5', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn5" onMouseOver="pmt('wldcaacAnswerBtn5', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn5" onMouseOver="pmt('wldcaacDetailBtn5', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci6" onMouseOver="pmt('wldci6', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn6" onMouseOver="pmt('wldcaacAnswerBtn6', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn6" onMouseOver="pmt('wldcaacDetailBtn6', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci7" onMouseOver="pmt('wldci7', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn7" onMouseOver="pmt('wldcaacAnswerBtn7', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn7" onMouseOver="pmt('wldcaacDetailBtn7', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci8" onMouseOver="pmt('wldci8', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn8" onMouseOver="pmt('wldcaacAnswerBtn8', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn8" onMouseOver="pmt('wldcaacDetailBtn8', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/master.svg" alt="" id="wldci9" onMouseOver="pmt('wldci9', '该习题由我创建');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn9" onMouseOver="pmt('wldcaacAnswerBtn9', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn9" onMouseOver="pmt('wldcaacDetailBtn9', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci10" onMouseOver="pmt('wldci10', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn10" onMouseOver="pmt('wldcaacAnswerBtn10', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn10" onMouseOver="pmt('wldcaacDetailBtn10', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci11" onMouseOver="pmt('wldci11', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn11" onMouseOver="pmt('wldcaacAnswerBtn11', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn11" onMouseOver="pmt('wldcaacDetailBtn11', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci12" onMouseOver="pmt('wldci12', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn12" onMouseOver="pmt('wldcaacAnswerBtn12', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn12" onMouseOver="pmt('wldcaacDetailBtn12', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                           <li>
                                <div class="wldcItem wldcItemOdd" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'odd');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci13" onMouseOver="pmt('wldci13', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">我国社会主义开始的标志是</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn13" onMouseOver="pmt('wldcaacAnswerBtn13', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn13" onMouseOver="pmt('wldcaacDetailBtn13', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                            <li>
                                <div class="wldcItem wldcItemEven" onMouseOver="lightUpRow(this);" onMouseOut="reBg(this, 'even');">
                                    <div class="pullleft wldcCheckboxBox">
                                        <input type="checkbox" class="wldccb">
                                    </div>
                                    <div class="pullleft wldcAttr">
                                        <img src="imgs/copy.svg" alt="" id="wldci14" onMouseOver="pmt('wldci14', '该习题由王老师分享');" onMouseOut="erasePmt();">
                                    </div>
                                    <div class="pullleft wldcAttr"></div>
                                    <div class="pullleft wldcContent">到底我国社会主义开始的标志是什么啊！！你知不知道？</div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont wldcAttrAfterContEnd">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacAnswerBtn14" onMouseOver="pmt('wldcaacAnswerBtn14', '点击查看该题答案');" onMouseOut="erasePmt();">
                                            <div class="answerButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright wldcAttr wldcAttrAfterCont">
                                        <div class="flatbtn wldcaacBtn" id="wldcaacDetailBtn14" onMouseOver="pmt('wldcaacDetailBtn14', '查看该习题的完整信息');" onMouseOut="erasePmt();">
                                            <div class="detailButtonImg"></div>
                                        </div>
                                    </div>
                                    <div class="pullright widcAttr">
                                        <div class="wldcQuickLookBtn flatbtn wldcAttrAfterCont">快速预览</div>
                                    </div>
                                    <div class="clearboth"></div>
                                </div>
                            </li>
                        </ul>
                    </div><!-- End of wldcListBox -->
                </div><!-- End of workLabelDownContainer -->
            </div>
		  </div><!-- End of LRRight -->          
		</div><!-- End of firstLR -->
        <div class="dynamicAnswer" id="dynamicAnswer">
        	<div class="daTit tbHead" id="daTit">答题动态</div>
			<div class="mainbox container dynamicAnswerItem">
                <div class="daInfo divInfo">
                  <div class="daInfoName">张丽莉</div>
                  <div class="daInfoTime">14:57</div>
                  <div class="daInfoDate">4月22日</div>
                </div>
                <div class="single_question_answer">
                    <div class="single_question">
                        1、在交互命令外壳里显示在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息。
                    </div>
                    <div class="singleSelect">
                        <ul style=" list-style:upper-latin;">
                            <li>在交互命令外壳里显外壳里显外壳里显外壳里显外壳里显示在</li>
                            <li>在交互命令外壳里外壳里显外壳里显显示在</li>
                            <li>在交互命令外壳里显外壳里显外壳里显外壳里显外壳里显外壳里显示在</li>
                            <li>在交互命令外壳里外壳里显外壳里显在</li>
                        </ul>
                    </div>
                </div>
                
                <div class="select_box">
                    <label for="A"><div class="select_btn selectA" onMouseUp="return setSelectActive('s1', 's2', 's3', 's4');" >A<span id="s1" class="selectActive" /></div></label>
                   <label for="B"><div class="select_btn selectB" onMouseUp="return setSelectActive('s2', 's1', 's3', 's4');">B<span id="s2" class="selectActive" /></div></label>
                    <label for="C"><div class="select_btn selectC" onMouseUp="return setSelectActive('s3', 's2', 's1', 's4');">C<span id="s3" class="selectActive" /></div></label>
                    <label for="D"><div class="select_btn selectD" onMouseUp="return setSelectActive('s4', 's2', 's3', 's1');">D<span id="s4" class="selectActive" /></div></label>
                    
                    <input type="radio" id="A" name="selectTopic" value="A"/>
                    <input type="radio" id="B" name="selectTopic" value="B"/>
                    <input type="radio" id="C" name="selectTopic" value="C"/>
                    <input type="radio" id="D" name="selectTopic" value="D"/>
                </div>
			</div>
            <div class="mainbox container dynamicAnswerItem">
                <div class="daInfo divInfo">
                  <div class="daInfoName">李玲</div>
                  <div class="daInfoTime">14:53</div>
                  <div class="daInfoDate">4月22日</div>
                </div>
                <div class="answer_question">
                    <div class="a_question">
                        2、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息。
                    </div>
                    <div class="inputArea">
                        <div class="a_txt">答：</div>
                        <textarea rows="10" cols="131" class="a_answer inputField sslote disabledIF" name="answer1" disabled >节点也可以拥有后代，
                        后代指某个节点的所有子节点，或者这些子节点的子节点，以此类推。
                        比方说，所有的文本节点都是节点的后代，而第一个文本节点的后代
大部分元素节点都有子节点。比方说， 节点有一个子节点：
	节点 节点也有一个子节点：
    文本节点 "DOM Tutorial"</textarea>
                    </div>
                </div>
            </div>
            <div class="mainbox container dynamicAnswerItem">
                <div class="daInfo divInfo">
                  <div class="daInfoName">张毅</div>
                  <div class="daInfoTime">14:50</div>
                  <div class="daInfoDate">4月22日</div>
                </div>
                <div class="judge_question">
                    <div class="j_question">
                        3、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息。
                    </div>
                </div>
                <div class="j_answer_box">
                    <label for="T1"><div class="j_true j_answer" onMouseUp="return setJudgeActive('j1', 'j2');">√<span id="j1" class="selectActive" /></div></label>
                    <label for="F1"><div class="j_false j_answer" onMouseUp="return setJudgeActive('j2', 'j1');">x<span id="j2" class="selectActive" /></div></label>
                    <input type="radio" name="judge1" value="T" id="T1" />
                    <input type="radio" name="judge1" value="F" id="F1" />            
                </div>
            </div>
            <div class="mainbox container dynamicAnswerItem">
                <div class="daInfo divInfo">
                  <div class="daInfoName">李刚</div>
                  <div class="daInfoTime">14:45</div>
                  <div class="daInfoDate">4月22日</div>
                </div>
                <div class="fill_vacant_question">
                    <div class="fv_question">
                        4、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI、在交互命令外壳里显示在交互命令外壳里显示 WMI 信息在<input type="text" name="fv_answer" class="fv_input" />交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息在交互命令外壳里显示 WMI 信息。
                    </div>
                </div>
            </div>        
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp" />
<script src="script/newExercise.js"></script>
</body>
</html>

