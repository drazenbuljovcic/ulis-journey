// import { NextResponse } from "next/server";

// export function middleware(request) {
//   const response = NextResponse.next();
//   console.log("Middleware runs on: ", new URL(request.url).pathname);

//   response.headers.set("Cross-Origin-Opener-Policy", "same-origin");
//   response.headers.set("Cross-Origin-Embedder-Policy", "require-corp");

//   return response;
// }

// // export default function middleware(request, response) {
// //   const url = new URL(request.url);
// //   console.log("Middleware runs on: ", url.pathname);

// //   response.headers.set("Cross-Origin-Opener-Policy", "same-origin");
// //   response.headers.set("Cross-Origin-Embedder-Policy", "require-corp");

// //   return response;
// // }
