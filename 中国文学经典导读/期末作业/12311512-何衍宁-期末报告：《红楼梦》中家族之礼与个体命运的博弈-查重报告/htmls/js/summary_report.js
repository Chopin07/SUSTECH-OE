/*================================================echarts-data========================================================*/
    var sentence_max_percent = parseInt($('#sentence_max_percent').html());
	var sentence_min_percent = parseInt($('#sentence_min_percent').html());
	var sentence_normal_percent = parseInt($('#sentence_normal_percent').html());
	var per_sum = sentence_max_percent+sentence_min_percent+sentence_normal_percent;
	var max_percent = (parseFloat(sentence_max_percent/per_sum)*100).toFixed(2)+'%';
	var min_percent = (parseFloat(sentence_min_percent/per_sum)*100).toFixed(2)+'%';
	var normal_percent = (parseFloat(sentence_normal_percent/per_sum)*100).toFixed(2)+'%';
	var chatrs_data = new Array();	
	var echatrs_data = new Array();
	var desc_percent_arr = new Array();
	
	//准备图表数据
	var data = echatrs_func_percent(sentence_max_percent,'相似度70%以上','#e95252');
	if(data != ''){
		echatrs_data.push(data);
		desc_percent_arr.push('相似度70%以上');
	}
	
	var data = echatrs_func_percent(sentence_min_percent,'相似度40%-70%','orange');
	if(data != ''){
		echatrs_data.push(data);
		desc_percent_arr.push('相似度40%-70%');
	}
	
	var data = echatrs_func_percent(sentence_normal_percent,'相似度合格','#32CD32');
	if(data != ''){
		echatrs_data.push(data);
		desc_percent_arr.push('相似度合格');
	}
	
  	//绘制图表.
    echarts.init(document.getElementById('main')).setOption({
		tooltip : {
			trigger: 'item', //触发类型，默认数据触发 (可选为：'item' | 'axis')
			formatter: "{a} {b} : {c} ({d}%)", //这里可以使用默认；
			axisPointer: {
                type: 'cross'
            },
            backgroundColor: 'rgba(107, 107, 107, 0.5)',
            borderWidth: 1,
            borderColor: '#ccc',
            padding: 8,
            textStyle: {
                color: 'white'
            },
            position: function (pos, params, el, elRect, size) {
                var obj = {top: 10};
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },
            extraCssText: 'width: 300px'
		},
		legend: {
			orient: 'vertical',
    		left: 'left',
    		data: desc_percent_arr,
			formatter: function(name) {
    			if(name === '相似度70%以上') {
        			return name + "："+max_percent;
    			}else if(name === '相似度40%-70%'){
					return name + "："+min_percent;
				}else{
					return name + "："+normal_percent;
				}
			},
    		tooltip:{
    	    	show:true,
    	    },
        },
    	series : [
    	          {
    	              name: '访问来源',
    	              type: 'pie',
    	              radius: '50%',
    	              data: echatrs_data
    	          }
    	 ]
    });
    /*================================================echarts-data========================================================*/
  
    var main_left = ($('#main').parent().parent().width()/2)-($('#main').width()/2);
    var main_top = ($('#main').parent().parent().height()/2)-($('#main').height()*0.60);
 	$('#main').css('margin-left',main_left+'px');
 	$('#main').css('margin-top',main_top+'px');
 	
 	$('.persentage-num-span').each(function(){
    	var is_pointer = $(this).html().indexOf('.');
    	if(is_pointer>=0) {
    		var percent = $(this).html().split('.')[1];
        	
        	var end_num_len = percent.split('%')[0].length;
        	if(end_num_len == 1) {
        		var percent_num = $(this).html().split('%')[0]+'0%';
        		$(this).html(percent_num);
        	}
    	}else{
    		if(parseInt($(this).html()) != 100) {
	        	var end_num = $(this).html().split('%')[0];
	        	$(this).html(end_num+'.00%');
    		}else{
    			$(this).html(parseInt($(this).html())+'%&nbsp;&nbsp;&nbsp;');
    		}
    	}
    	
    	var percent_num = parseFloat($(this).html());
    	if(percent_num >= 70) {
    		$(this).next().find('span').css('background-color','#e95252');
    	}else if(percent_num>=40 && percent_num<70){
    		$(this).next().find('span').css('background-color','orange');
    	}else if(percent_num<40){
    		$(this).next().find('span').css('background-color','#32CD32');
    	}
    });
 	 
 	//百分比数据准备
 	function echatrs_func_percent(percent_num,desc_percent,echatrs_bg_color) {
		if(percent_num != 0){
			var data_obj = new Object();
			data_obj = {value:percent_num, name:desc_percent,itemStyle: {normal: {color:echatrs_bg_color,}}};
			return data_obj;
		}
		return ''; 
	}