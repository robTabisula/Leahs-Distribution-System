$(document).ready(function(){
	$.getJSON('http://localhost:8181/LeahFP/fragments/data.php', function(data){
            console.log(data);

            var name = [];
            var Frequency = [];

            for (var i in data){
                name.push(data[i].name);
                Frequency.push(data[i].Frequency);
            }

            var chartdata = {
                labels: name,
                datasets: [{
                    label:'Frequency',                                                           
                    data: Frequency

                }]
            };
        
            var ctx = $("#prodpie");
            var myBarChart = new Chart(ctx, {
            	width:320,
                type: 'pie',
                data: chartdata
            });


    });

});