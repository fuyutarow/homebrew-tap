class Agx < Formula
  version "1.22.67"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.67/agx-1.22.67-darwin-arm64.tar.gz"
      sha256 "4e410a80c259acd3f1be6a4fb3a3dc26b5370d5043f0f742228e3e0e0789420d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.67/agx-1.22.67-darwin-x64.tar.gz"
      sha256 "d51f5f178ca1bd07260426e96ad95c6e6e7895a05b6fc38332a5b7ee876a56e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.67/agx-1.22.67-linux-arm64.tar.gz"
      sha256 "c4f600a2482dde6feaf13ee0570b689b02dd176528dbbfcaf35eb1b3eac773f9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.67/agx-1.22.67-linux-x64.tar.gz"
      sha256 "35e084f8a163d2961ade33c33a871684ece75753125b2c13b7eacdcd87af9b8d"
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
