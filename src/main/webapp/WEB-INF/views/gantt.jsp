<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="assets/css/nav.css">
<jsp:include page="nav.jsp" />

<script src="https://kit.fontawesome.com/a613319909.js"
	crossorigin="anonymous"></script>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">

<title>gantt chart</title>
<!--     
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
-->


<link
	href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.chartMenu {
	width: 100vw;
	height: 40px;
	background: #1A1A1A;
	/*  color: rgba(54, 162, 235, 1); */
	color: white;
}

.chartMenu p {
	padding: 10px;
	font-size: 20px;
}

.chartCard {
	margin: auto;
	width: 1200px;
	/*  width: 100vw; */
	height: calc(100vh - 40px);
	/* background: rgba(54, 162, 235, 0.2); */
	/* background: white; */
	display: flex;
	align-items: center;
	justify-content: center;
}

.chartBox {
	width: 1200px; /* 차트 박스 크기 조절 / 차트 크기로 인해 날짜가 간격 차이 남 */
	height: 750px padding: 20px;
	border-radius: 20px;
	border: solid 3px #8CDDCD;
	background: white;
}

#kanbandiv {
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: 880px;
	height: 60px;
}

#kanbanTable {
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 100px;
	height: 60px;
	float: right;
}
</style>

<!-- 프로젝트 상태표시 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>

<body>
	<jsp:include page="nav.jsp" />

	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="row">
				<!-- 간트차트 감싸는 DIV -->

				<div class="col-xl-12 col-md-10" style="margin-top: 40px">
					<div class="card table-card">
						<div class="card-header" style="padding-bottom: 0px;">
							<h3>일정</h3>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<div class="chartMenu" style="display: none;">
									<p>
										<span id="chartVersion"></span>
									</p>
								</div>

								<div class="chartCard" style="margin-top: -40px" >
									<div class="chartBox">
										<canvas id="myChart"></canvas>
										<!-- <div id="kanbandiv"> -->
										<table id="kanbanTable">
											<tr>
												<td><input type="month" onchange="chartFilter(this)"
													style="margin-right: 20px; width: 123.63636px; height: 30.63636px;" /></td>
												<td><button type="button" onclick="hrefLink()"
														class="btn btn-primary btn-sm scheduleAdd">
														<i class="fa-regular fa-pen-to-square"
															style="color: #fff;"></i>&nbsp;&nbsp;칸반보드 이동
													</button></td>
											</tr>
										</table>
										<!-- </div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

	<script>    
    
  	var gproject_info;  // 프로젝트 정보
  	var gproject_task;	// 프로젝트에서 간단하게 업무생성된거 보기
  	
  	var glist = []; 
  	var tasklist = [];  
  	var member_no = ${memberDTO.member_no};
  	function hrefLink() { /* 칸반보드로 이동하기 => 칸반 완성 후 수정하기*/
  		console.log(member_no);
  		location.href = "/kanban?member_no="+member_no;
  	}
  	
    function projectinfo() {
    	
	    $.ajax({
	        url: "<c:url value="/data" />",	        
	        type: "get",
	        data: {
	        	"member_no":${no}
	        },
	        //data: JSON.stringify(obj),
	        dataType: "json",
	        contentType: "application/json",
	        success: function(project_info) {
	        	
	        	console.log("project_info : " + project_info);
	        	
	        	gproject_info = project_info;	// 전역변수로 선언하기 위한 대입

	            for(var i=0; i<=project_info.length-1; i++ ){
		            
					var p = {
				    		"project_no": gproject_info[i].project_no, 
				    		"project_title": gproject_info[i].project_title, 
				    		"project_start_date": gproject_info[i].project_start_date, 
				    		"project_end_Date": gproject_info[i].project_end_Date,
				    		"project_description": gproject_info[i].project_description,
				    		"project_status": gproject_info[i].project_status,
				    		"color": gproject_info[i].color,
				    		"name": gproject_info[i].name
			    	};
					
		            console.log(
		            		p.project_no  + " : " + 
		            		p.project_title + " : " + 
		            		p.project_start_date + " : " + 
		            		p.project_end_Date + " : " + 
		            		p.project_description + " : " + 
		            		p.project_status + " : " + 
		            		p.color + " : " +
		            		p.name)
					
		             glist.push(p); 		             
		             		        
	            } // for end
	        	       		        		      	            		                  		               
	        }, // function(project_info) end
	        
	        error: function(errorThrown) {
	            alert(errorThrown.statusText);
	        }, // error end
	        async: false
	    }); // ajax end
    	
	} // projectinfo() end
  
    projectinfo(); //  projectinfo() 실행해 
      
    console.log("projectinfo : " + glist);    
        
    // ajax으로 데이터 가져옴 => 함수명 : projecttask / 전역함수 : gproject_task => for문으로 task라는 변수에 담음  
    // => tasklist 리스트 생성 후 tasklist에 push
    
    function projecttask(){
    	
    	$.ajax({
	        url: "<c:url value="/taskdata" />",	        
	        type: "get",
	        data: {
	        	"member_no":${no}	        	
	        },
	        dataType: "json",
	        contentType: "application/json",
	        success: function(project_task){
	        	
	        	gproject_task = project_task;
	        	
	        	for(var i=0; i<=project_task.length-1; i++){
	        		var task = {
	        				"task_title":gproject_task[i].task_title,
	        				"task_content":gproject_task[i].task_content
	        		};
	        		
	        		console.log("task_title : " + task.task_title + " , task_content : " + task.task_content)
	        		
	        		tasklist.push(task);
	        		
	        	}
	        		        	
	        },
	        error: function(errorThrown) {
	            alert(errorThrown.statusText);
	        }, // error end
	        async: false		
    	}); // ajax end	
   	
    } // projecttask() end 
    
    projecttask();
    
    console.log("projecttask : " + tasklist); 
        
    // json형식 예시    
//	[
	//x : 시작일 / 종료일, y : 프로젝트 이름 / 업무이름, name : 이름 / 다수 이름일 경우 [] 에 작성
   	// Completed : 2 / pending : 1 / Delayed : 0   	
   	//{x:[p.x, p.y], y: 'task1', name: 'James', status: 2 },
   	
//	]
   
	var project_no;
	var project_title;
	var project_start_date;
	var project_end_Date;
	var project_description;
	var	project_status; 
	var color;
	var name;
	
	var mglist = [];
	
	for(var ele in glist){
		
		console.log("프로젝트 번호 : " + glist[ele].project_no);
		console.log("프로젝트 제목 : " + glist[ele].project_title);
		console.log("프로젝트 시작일 : " + glist[ele].project_start_date);
		console.log("프로젝트 마감일 : " + glist[ele].project_end_Date);
		console.log("프로젝트 내용 : " + glist[ele].project_description);
		console.log("프로젝트 상태 : " + glist[ele].project_status);
		console.log("프로젝트 색깔 : " + glist[ele].color);
		console.log("이름 : " + glist[ele].name);
		
		console.log("-----------");
				
		var t = {x:[glist[ele].project_start_date, glist[ele].project_end_Date], y:glist[ele].project_title, name:glist[ele].name, status:glist[ele].project_status};
		
		mglist.push(t);
		
	}
	console.log("mglist check : " + mglist);
	
	var task_title;
	var task_content;

	var mtasklist = [];
	
	for(var ele in tasklist){
		console.log("업무 제목 : " + tasklist[ele].task_title);
		console.log("업무 내용 : " + tasklist[ele].task_content);
		
		console.log("-----------");
		
		var tl = {x:tasklist[ele].task_title , y:tasklist[ele].task_content};
		mtasklist.push(tl);
		
	}
	console.log("mtasklist check : " + mtasklist);
  
    // setup  
    const data = {
      //labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: '보여주기/숨기기',
        
        data: mglist,
        
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1,
        borderSkipped: false,
        borderRadius: 10,
        barPercentage: 0.5
      }]
    };
	
    // status plugin block => 상태 정보 표시
    const status = {
      id : 'status',
      afterDatasetsDraw(chart, args, pluginOptions){
        const {ctx, data, chartArea: { top, bottom, left, right }, scales: { x, y} } = chart;
        
      	/*  const colors=['rgba(255, 26, 104, 1) - 빨강','rgba(255, 159, 64, 1) - 보류색','rgba(75, 192, 192, 1) - 완료색']; */
        // 아이콘 "진행중 - \uf110 / 완료 - \uf087" \uf14a
        // 프로젝트상태 - 0 : 진행 / - 1 : 완료 / - 2 : 보류
	  	const icons=['\uf110','\uf087','\uf14a'];
      	const colors=['rgba(89, 228, 131, 1)','rgba(164, 164, 164, 1)','rgba(216, 106, 96, 1)'];
      
        const angle = Math.PI / 180;
        
        ctx.save();
        ctx.font = 'bolder 12px FontAwesome';
        ctx.textBaseline = 'middle';
        ctx.textAlign = 'center';
        
        data.datasets[0].data.forEach((datapoint, index) => {
          ctx.beginPath();	
          ctx.fillStyle = colors[datapoint.status];
          //ctx.arc(x, y, radius, angleS, angleE, false);
          ctx.arc(right+ 50, y.getPixelForValue(index), 12, 0, angle*360, false);
          ctx.closePath();
          ctx.fill();
          ctx.fillStyle = 'white';
          
          ctx.fillText(icons[datapoint.status], right+ 50, y.getPixelForValue(index)); // 차트 우측 상태표시 / right+ 10으로 간격 조절
        })
        ctx.restore();
      }
    }
   
    // assignedTasks plugin block => 이름 표시
     const assignedTasks = {
      id : 'assignedTasks',
      afterDatasetsDraw(chart, args, pluginOptions){
        const {ctx, data, chartArea: { top, bottom, left, right }, scales: { x, y} } = chart;

        ctx.font = 'bolder 12px sans-serif';
        ctx.fillStyle = 'black';
        ctx.textBaseline = 'middle';
       	//ctx.textAlign = 'left'; // => ctx.restore() 로 인해 해당 라인을 주석 처리해도 글자 일부가 왼쪽으로 이동해서 가려지는 현상을 없애준다
								  
/*         data.datasets[0].data.forEach((datapoint, index) => {
          ctx.fillText(datapoint.name, 10, y.getPixelForValue(index)); // 차트 좌측 이름표시 
        }) */
      }
    } 
 
    // config 
    const config = {
      type: 'bar',
      data,    
      options: {
        layout: {
          padding: {
            left: 100,	// 이름을 넣기 위해 왼쪽 공간 확보
            right: 100  // 상태정보를 넣기 위해 오른쪽 공간 확보
          }
        },
	    indexAxis:'y',	
	    
        scales: {       	
          x: {       	  
            position: 'top',
            type: 'time',            
            time: {
            	//unit: 'day', // 월 : month / 일 : day
            	displayFormats:{
            		day: 'd'
            	}
            },           
            min: '2023-08-01',	// x축 : 차트 처음 시작일
            max: '2023-08-31'	// x축 : 차트 끝 종료일
          }                  
        },
        plugins:{ 
        	
        	tooltip: {
        		
        		
        		/* 그래프에 마우스 올려놓을 때 보이는 color 제거*/
        		displayColors: false,
        		yAlign : 'bottom',
        		
        		callbacks: {
        			
        			/* 그래프에 마우스 올려놓을 때 보이는 label 제거*/
        			label:(ctx) => {
        				//console.dir(ctx[0].label);
        				/* return  mtasklist; */ /* => 일단 보류<칸반보드 진행후>(간략한 업무생성된거 보이게하기) */
        				return '';
        			},
        			
        			title: (ctx) => {
        				//console.dir(ctx);
        				//console.log(ctx[0].raw.x[0])
        				
        				const startDate = new Date(ctx[0].raw.x[0])
        				const endDate = new Date(ctx[0].raw.x[1])
        				
        				//console.log(startDate)
        				//console.log(endDate)
        				
        				const formattedStartDate = startDate.toLocaleString([], {
        					year:'numeric',
        					month:'short',
        					day:'numeric',       					
        				});        				        			
        				
        				const formattedEndDate = endDate.toLocaleString([], {
        					year:'numeric',
        					month:'short',
        					day:'numeric',       					
        				});      			
        				
        				return [ctx[0].raw.name, "기간 : " + formattedStartDate + " ~ " + formattedEndDate];
        			
        			}
        		}
        	}
        }
      },
      plugins: [assignedTasks, status]     
    };

    // render init block
    const myChart = new Chart(
      document.getElementById('myChart'),
      config
    );
    
    function chartFilter(date){
    	const year = date.value.substring(0,4);
    	const month = date.value.substring(5,7);
    	const lastDay = (y,m) => {
	    	return new Date(y,m,0).getDate();    		
    	}
    	console.log(year)
    	console.log(month)
    	console.log(lastDay(year,month))
    	
    	const startDate = year + "-" + month + "-" + "01";
    	console.log(startDate)
    	const endDate = year + "-" + month + "-" + lastDay(year,month);
    	console.log(endDate)
    	
    	myChart.config.options.scales.x.min = startDate;
    	myChart.config.options.scales.x.max = endDate;
    	myChart.update();
    	
    }
       
    // Instantly assign Chart.js version
    const chartVersion = document.getElementById('chartVersion');
    chartVersion.innerText = Chart.version;
    </script>

</body>
</html>