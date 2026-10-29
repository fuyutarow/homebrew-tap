class Semlint < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/semlint"
  version "0.2.0"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # semlint-0.2.0-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.0/semlint-0.2.0-darwin-arm64.tar.gz"
      sha256 "094703ffe37be19ce30ba5a1b72dac1412f60957381a9731618143556cffa080"
    end

    on_intel do
      # semlint-0.2.0-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.0/semlint-0.2.0-darwin-x64.tar.gz"
      sha256 "de12181ab5a23b63d770ff2c0c084947e56440dea165ee6bc9e10a46e846fece"
    end
  end

  on_linux do
    on_arm do
      # semlint-0.2.0-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.0/semlint-0.2.0-linux-arm64.tar.gz"
      sha256 "3682714ed3e305d7e8be4ebedae32b278976382588ee436727c3d9f941cd16dc"
    end

    on_intel do
      # semlint-0.2.0-linux-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v0.2.0/semlint-0.2.0-linux-x64.tar.gz"
      sha256 "83df954085070dee146bc3e2ab34a8c8713602be927f921dd09004bbbeb636fb"
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
