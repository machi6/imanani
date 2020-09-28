window.addEventListener('load', function(){
  //縦線の調整
  let vertical_line_height = document.getElementById("all_products_wrapper").clientHeight;
  console.log(vertical_line_height);
  let ite_date = 0;
  for(i = 0; i<168; i++){
    if (i % 24 == 0){
      let date_disp = document.getElementById("date_disp_" + String(ite_date));
      date_disp.setAttribute("style", `left: ${ite_date*1440+360}px;`)
      ite_date += 1;
      }
    let time_disp = document.getElementById("time_disp_" + String(i));
    time_disp.setAttribute("style", `left: ${i*60+360}px;`)

    let vertical_line = document.getElementById("vertical_line_" + String(i));
    vertical_line.setAttribute("style", `left: ${i*60+360}px; height: ${vertical_line_height}px;`);
    
  }

  // //タスクの位置を調整
  // let num_of_all_issue = document.getElementsByClassName("issue_wrapper").length;
  // console.log(num_of_all_issue);
  // let task_start_element = document.getElementsByClassName("task_start");
  // let task_time_element = document.getElementsByClassName("task_time");
  // let task_wday_element = document.getElementsByClassName("task_wday");
  // let i = 0;
  // for (h = 0; h< num_of_all_issue; h++){
  //   for( ; i<task_start_element.length; i++){
  //     //1minで1px 1hourで60px 1dayで1440px
  //     let start_time_H = Number(task_start_element[i].getAttribute("value").split(':')[0]);//15:30開始なら15
  //     let start_time_M = Number(task_start_element[i].getAttribute("value").split(':')[1]);//15:30開始なら30
  //     let start_time_wday = task_wday_element[i].getAttribute("value");
  //     console.log(start_time_wday);
  //     let start_pos = (start_time_H * 60) + (start_time_M) + (start_time_wday * 1440);
      
  //     let width = Number(task_time_element[i].getAttribute("value"));//1Hかかるなら3600(秒)
  

  //     let task_bar = document.getElementById("task_bar_" + String(i));
  //     task_bar.setAttribute("style", `width:${width/60}px; margin-left: ${start_pos}px;`);
  //     let task_character = document.getElementById("task_character_" + String(i));
  //     task_character.setAttribute("style", `margin-left: ${start_pos}px;`);
  //   }
  // }
})
