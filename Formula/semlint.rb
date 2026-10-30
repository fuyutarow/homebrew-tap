class Semlint < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/semlint"
  version "0.2.1"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # semlint-0.2.1-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.1/semlint-0.2.1-darwin-arm64.tar.gz"
      sha256 "e8372ea972bdb36d28fad97c142878dff5e53ffc1811735a0cbd4669b3aa2efa"
    end

    on_intel do
      # semlint-0.2.1-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.1/semlint-0.2.1-darwin-x64.tar.gz"
      sha256 "4ec50289ad66aa89b6cabcf06e65664a8a4936c2541b16387ed0a545dd3612fe"
    end
  end

  on_linux do
    on_arm do
      # semlint-0.2.1-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.1/semlint-0.2.1-linux-arm64.tar.gz"
      sha256 "9e545d2b29144f34ecd6e926b4c8e2d30ca1262fbb109389dc3520f1efa4f720"
    end

    on_intel do
      # semlint-0.2.1-linux-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.1/semlint-0.2.1-linux-x64.tar.gz"
      sha256 "2fadb0020f13bb005fadd800457f5acd7483ca631484291be537883ba5fe4073"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables
  end

  test do
    assert_equal "semlint #{version}", shell_output("#{bin}/semlint --version").strip
  end
end
