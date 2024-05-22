const fs = require("fs");

function replaceTemplateContent(filePath, newContent) {
  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error(err);
      return;
    }

    const result = data.replace("<!-- app_scripts -->", newContent);

    fs.writeFile(filePath, result, "utf8", (err) => {
      if (err) {
        console.error(err);
      }
    });
  });
}
