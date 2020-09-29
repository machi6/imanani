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
    
    //1minで1px 1hourで60px 1dayで1440px
    //横位置の調整
    start = tasks[i].dataset.start.split(':');
    let start_time_H = Number(start[0]);//15:30開始なら15
    let start_time_M = Number(start[1]);//15:30開始なら30
    let start_time_wday = Number(tasks[i].dataset.wday);
    let start_pos = (start_time_H * 60) + (start_time_M) + (start_time_wday * 1440);
    document.getElementById(tasks[i].id).setAttribute("style", `top: ${task_top}px; left: ${start_pos}px;`);
    
    time = tasks[i].dataset.time.split(':');
    let time_H = Number(time[0]);
    let time_M = Number(time[1]);
    let bar_width = time_H * 60 + time_M;
    bar_id = tasks[i].id.replace('task', 'bar');
    document.getElementById(bar_id).setAttribute("style", `width: ${bar_width}px;`);
  }
})
