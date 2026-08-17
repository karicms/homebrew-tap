class RenameDraft < Formula
  desc "文件夹与文件分级编号重命名工具"
  homepage "https://github.com/karicms/rename_draft"
  url "https://github.com/karicms/rename_draft/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "dc6eb1e6a47f803456c85e5d13b2adb494b2d92fb9763e9b33f6a9e15f42af0c"
  license "MIT"

  # 本机已有 python3 则跳过；没有才让 Homebrew 安装 python@3。
  # （个人 tap 可用；官方 homebrew-core 一般不允许这种按机器状态的条件依赖。）
  depends_on "python@3" unless which("python3")

  def install
    bin.install "rename_draft.py" => "rename-draft"
  end

  def caveats
    <<~EOS
      rename-draft 通过 #!/usr/bin/env python3 调用本机 PATH 上的 Python。
      安装时若已检测到 python3，不会再通过 Homebrew 下载 Python；
      若当时没有，则会自动安装依赖 python@3。
    EOS
  end

  test do
    assert_predicate bin/"rename-draft", :exist?
  end
end
