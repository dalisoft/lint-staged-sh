import { prepare, maps } from "binary2npm";

maps.os = {
  linux: "Linux",
  freebsd: "Freebsd",
  darwin: "MacOS",
  win32: "Windows",
};
maps.arch = {
  arm64: "arm64",
  x64: "x86_64",
  x86: "x86_64",
};

await prepare({
  remote: "github",
  author: "evilmartians",
  repository: "lefthook",
  remoteToken: process.env.GITHUB_TOKEN,
  binary: "lefthook",
  orders: ["binary", "version", "os", "arch"],
});
