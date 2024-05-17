const express = require("express");
const app = express();

app.use((req, res, next) => {
  res.setHeader("Cross-Origin-Opener-Policy", "same-origin");
  res.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
  next();
});

app.use(express.static("public")); // assuming your index.html is in a directory named 'public'

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server is running on port ${port}`));
