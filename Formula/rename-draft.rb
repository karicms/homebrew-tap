class RenameDraft < Formula
  desc "文件夹与文件分级编号重命名工具"
  homepage "https://github.com/karicms/rename_draft"
  url "https://github.com/karicms/rename_draft/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "dc6eb1e6a47f803456c85e5d13b2adb494b2d92fb9763e9b33f6a9e15f42af0c"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "rename_draft.py" => "rename-draft"
  end

  test do
    assert_predicate bin/"rename-draft", :exist?
  end
end
