document.addEventListener("DOMContentLoaded", function() {
    
    const categorySelect = document.getElementById("category");
    const positionArea = document.getElementById("position-area");

    
    categorySelect.addEventListener("change", function() {
        
        if (categorySelect.value === "グラブ" || categorySelect.value === "ミット") {
           
            positionArea.style.display = "block";
        } else {
            
            positionArea.style.display = "none";
        }
    });
});