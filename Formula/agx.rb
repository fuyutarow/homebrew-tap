class Agx < Formula
  version "10.4.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.2/agx-10.4.2-darwin-arm64.tar.gz"
      sha256 "6d0dcdf779cac6021513a6e4912c708fa60412660528294bcccd20429a35e6a8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.2/agx-10.4.2-darwin-x64.tar.gz"
      sha256 "4b2b5bc5e362090f4bd532011ace5a4a1f1137ca63b1fafb7f9905989c0cefa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.2/agx-10.4.2-linux-arm64.tar.gz"
      sha256 "f2b20d99cf0a59d74a3b6302bad369ab04bf304ff78ac01364de9db947b9ccf4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.2/agx-10.4.2-linux-x64.tar.gz"
      sha256 "e08e7581ee78ec467eae06808026f22c612e360ed3984a894ea902c8661da4c5"
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
