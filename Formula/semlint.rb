class Semlint < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/semlint"
  version "0.2.2"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # semlint-0.2.2-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.2/semlint-0.2.2-darwin-arm64.tar.gz"
      sha256 "af029e919e24b5d0978243f83c26ee8045b472bb09b83009bec24122f6fae7c0"
    end

    on_intel do
      # semlint-0.2.2-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.2/semlint-0.2.2-darwin-x64.tar.gz"
      sha256 "6cb4bb1d70094a20843235d1f0e1d5dd0dd44843717f5f25aefafb09acd39605"
    end
  end

  on_linux do
    on_arm do
      # semlint-0.2.2-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.2/semlint-0.2.2-linux-arm64.tar.gz"
      sha256 "627ef0692abe4036f36c06008b9bc6334cf6cb2c6b2062fcfdbf6b9a473fee21"
    end

    on_intel do
      # semlint-0.2.2-linux-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.2/semlint-0.2.2-linux-x64.tar.gz"
      sha256 "4736b34798e55318960e6b73377ddb7f93376f9426e9a1713b179cf660e961cc"
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
