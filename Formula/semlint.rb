class Semlint < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/semlint"
  version "0.2.3"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # semlint-0.2.3-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.3/semlint-0.2.3-darwin-arm64.tar.gz"
      sha256 "35c827366b650694fc948197e9f9ef09d67d6dac08772b6f072c9743f3a0e4f6"
    end

    on_intel do
      # semlint-0.2.3-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.3/semlint-0.2.3-darwin-x64.tar.gz"
      sha256 "0c698b6cde51dabbd527de05a08e6147d9a8c07029f0ef1acebd519cd34d15e9"
    end
  end

  on_linux do
    on_arm do
      # semlint-0.2.3-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.3/semlint-0.2.3-linux-arm64.tar.gz"
      sha256 "a909eef9ce3cbb7e934a413a7ce3e308775bc58ea0e25bf4b9805ce22580aa26"
    end

    on_intel do
      # semlint-0.2.3-linux-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.3/semlint-0.2.3-linux-x64.tar.gz"
      sha256 "9ab6129180921f432ae9b97df632e578564241b108a11638074ffbe949a71149"
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
