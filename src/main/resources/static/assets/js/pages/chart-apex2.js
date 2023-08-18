'use strict';
function getChartDataFromServer(projectNo, callback) {
    $.ajax({
        url: '/task/status?project_no=' + projectNo,
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            callback(response); // 서버에서 받은 데이터를 콜백으로 전달
        },
        error: function(error) {
            console.error('Error fetching data from the server:', error);
        }
    });
}

// 그래프를 그리는 함수
function drawChartWithData(data) {
    var options = {
        chart: {
            height: 320,
            type: 'donut',
        },
        series: data,
        colors: ["#1abc9c", "#0e9e4a", "#00acc1", "#f1c40f", "#e74c3c"],
                legend: {
                    show: true,
                    position: 'bottom',
                },
                plotOptions: {
                    pie: {
                        donut: {
                            labels: {
                                show: true,
                                name: {
                                    show: true
                                },
                                value: {
                                    show: true
                                }
                            }
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    dropShadow: {
                        enabled: false,
                    }
                },
                responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

    var chart = new ApexCharts(
        document.querySelector("#pie-chart-2"),
        options
    );
    chart.render();
}

$(document).ready(function() {
    // 페이지 로드 후 700ms 뒤에 실행
    setTimeout(function() {
        // 프로젝트 번호를 지정하여 데이터 가져오기
        const projectNo = 1; // 원하는 프로젝트 번호로 변경
        getChartDataFromServer(projectNo, function(data) {
            // 데이터 가져오기 성공 시 그래프 그리기
            drawChartWithData(data);
        });
    }, 700);
});
