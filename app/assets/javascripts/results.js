document.addEventListener("turbolinks:load",function(){
  document.querySelectorAll(".progress").forEach(function(progress){
    const max_count = progress.id.split("-")[2];
    const num_count = progress.id.split("-")[1];
    const key = progress.id.split("-")[3];


    const label = document.getElementById(`label-${num_count}-${max_count}-${key}`);
    label.textContent = "0(0%)";


    let this_count = 0;
  


    progress.value = 0;
    setInterval(() => {
      progressBarSet();
    },70);
   
    
    function progressBarSet() {
      if(this_count <= num_count){
        progress.value = this_count
        let rate =parseInt( parseFloat(this_count) / parseFloat(max_count) * 100);
        label.textContent = `${this_count}(${rate}%)`;
        this_count += 1;
      }
      else{
        clearInterval();
      }
    }

  });
});
