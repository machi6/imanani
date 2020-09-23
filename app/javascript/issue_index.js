window.addEventListener('load', function(){
  let task_start_element = document.getElementsByClassName("task_start");
  let task_time_element = document.getElementsByClassName("task_time");
  let task_wday_element = document.getElementsByClassName("task_wday");
  for( i =0; i<task_start_element.length; i++){
    //1minで1px 1hourで60px 1dayで1440px
    let start_time_H = Number(task_start_element[i].getAttribute("value").split(':')[0]);//15:30開始なら15
    let start_time_M = Number(task_start_element[i].getAttribute("value").split(':')[1]);//15:30開始なら30
    let start_time_wday = task_wday_element[i].getAttribute("value");
    console.log(start_time_wday);
    let start_pos = (start_time_H * 60) + (start_time_M) + (start_time_wday * 1440) - 360 ;

    //let task_time_element = document.getElementsByClassName("task_time");
    let width = Number(task_time_element[i].getAttribute("value"));//1Hかかるなら3600(秒)


    let task_wrapper = document.getElementById("task_wrapper_" + String(i));
    task_wrapper.setAttribute("style", `width:${width/60}px; margin-left: ${start_pos}px;`);
    let task_character = document.getElementById("task_character_" + String(i));
    task_character.setAttribute("style", `margin-left: ${start_pos}px;`)
  }
})