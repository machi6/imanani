window.addEventListener('load', function(){
  //関数群
  function convert_parent_issue_id(task){
    return task.id.split('|')[0].replace('task', 'issue')
  }
  function get_task_height(){
    //do not call this function when there is no task at any issues. 
    task = document.getElementsByClassName("task");
    if(task.length == 0) {return;}
    else{ return document.getElementById((task[0].id)).clientHeight;}
  }

  //issueの縦幅の調整
  let tasks_ = document.getElementsByClassName("task");
  let issue_ids_from_tasks = [];
  for (i = 0; i<tasks_.length; i++){
    issue_ids_from_tasks.push(convert_parent_issue_id(tasks_[i]));
  }

  let issue_ids = [];
  let issues_ = document.getElementsByClassName("issue");
  for (i = 0; i < issues_.length; i++){
    issue_ids.push(issues_[i].id);
  }
  for(i = 0; i<issue_ids.length; i++){
    count = 0;
    for(j = 0; j< issue_ids_from_tasks.length; j++){
      if(issue_ids[i] == issue_ids_from_tasks[j]){count += 1;}
    }
    if(count > 3){
      document.getElementById(issue_ids[i]).setAttribute("style", `height: ${(count + 1) * get_task_height()}px;`);
    }
  }

  //縦線の位置を設定
  let vertical_line_height = document.getElementById("main").clientHeight;
  let ite_date = 0;
  for(i = 0; i<168; i++){
    if (i % 24 == 0){
      let date_disp = document.getElementById("date_disp_" + String(ite_date));
      date_disp.setAttribute("style", `left: ${ite_date*1440}px;`)
      ite_date += 1;
      }
    let time_disp = document.getElementById("time_disp_" + String(i));
    time_disp.setAttribute("style", `left: ${i*60}px;`)

    let vertical_line = document.getElementById("vertical_line_" + String(i));
    vertical_line.setAttribute("style", `left: ${i*60}px; height: ${vertical_line_height}px;`);
  }

  //タスクの位置を調整
  let tasks = document.getElementsByClassName("task");
  let parent_issue_id_stack = [];
  for (i = 0; i<tasks.length; i++){
    //縦位置の調整
    let issue_id = convert_parent_issue_id(tasks_[i]);
    let task_top = document.getElementById(issue_id).offsetTop;
    //一つのissueにtaskが重複している場合は縦にずらす調整を加える
    for(j = 0; j < parent_issue_id_stack.length; j++){
      if(parent_issue_id_stack[j] == issue_id){
        task_top += get_task_height();
      }
    }
    parent_issue_id_stack.push(issue_id);
    document.getElementById(tasks[i].id).setAttribute("style", `top: ${task_top}px;`);
    //横位置の調整
    //console.log( document.getElementById(tasks[i].id).dataset.start);
    console.log( tasks[i].dataset.start);
    
    time = tasks[i].dataset.start.split(':');
    let start_time_H = Number(time[0]);//15:30開始なら15
    let start_time_M = Number(time[1]);//15:30開始なら30
    let start_time_wday = Number(tasks[i].dataset.wday);
    let start_pos = (start_time_H * 60) + (start_time_M) + (start_time_wday * 1440);
    document.getElementById(tasks[i].id).setAttribute("style", `top: ${task_top}px; left: ${start_pos}px;`);
  }

  //タスクの横位置を修正
  

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
