class RenameDraft < Formula
  desc "文件夹与文件分级编号重命名工具"
  homepage "https://github.com/karicms/rename_draft"
  url "https://github.com/karicms/rename_draft/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "dc6eb1e6a47f803456c85e5d13b2adb494b2d92fb9763e9b33f6a9e15f42af0c"
  license "MIT"

  # 不依赖 Homebrew 的 python@3，避免强制下载一整套 Python。
  # 运行时使用本机 PATH 上的 python3（#!/usr/bin/env python3）。

  def install
    unless which("python3")
      opoo "未检测到 python3。仍会安装命令，但运行前请先自行安装 Python 3。"
    end
    bin.install "rename_draft.py" => "rename-draft"
  end

  def caveats
    <<~EOS
      rename-draft 使用本机已有的 python3，不会通过 Homebrew 自动安装 Python。
      若运行时报找不到 python3，请先安装，例如：
        brew install python
    EOS
  end

  test do
    assert_predicate bin/"rename-draft", :exist?
  end
end
