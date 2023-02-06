import { writeFile, readFile } from 'fs-web';
 
let input = document.querySelector('input[type="file"]'); 
input.addEventListener('change', function(e) {
  let file = this.files[0]; // file is a File object.
 
  writeFile(file.name, file).then(function() {
    // All done! File has been saved.
  });
});