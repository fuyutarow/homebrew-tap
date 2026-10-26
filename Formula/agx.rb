class Agx < Formula
  version "1.13.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.4/agx-1.13.4-darwin-arm64.tar.gz"
      sha256 "783febcf02aedb13431f72b3a8884376d32a035063adbaa9e15993b485888f4e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.4/agx-1.13.4-darwin-x64.tar.gz"
      sha256 "b697ce38230895888aa6b76f728404538ecbaa9428b42ad2d686bc509318d498"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.4/agx-1.13.4-linux-arm64.tar.gz"
      sha256 "4151a87c58f63108df1f181027ccf7edef37caa54e473736b744de185b983b47"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.4/agx-1.13.4-linux-x64.tar.gz"
      sha256 "4c203546162c135ce90f4f3c74cc4dd739a793983536a3d6c1aeb5d181d4f155"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
