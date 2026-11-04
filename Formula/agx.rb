class Agx < Formula
  version "1.22.89"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.89/agx-1.22.89-darwin-arm64.tar.gz"
      sha256 "02961e6401d6792450f1f1b95bf293b83ecffb8e5599359fa83d50277ad10f88"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.89/agx-1.22.89-darwin-x64.tar.gz"
      sha256 "ae4a48057acab537115cb450bb3f138d8bc3837bc357895c4730f8e44a65f04d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.89/agx-1.22.89-linux-arm64.tar.gz"
      sha256 "0e9928867531184be814f402bc4de9ac4289cc41213f4fb68e53f4eb6a4e28f4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.89/agx-1.22.89-linux-x64.tar.gz"
      sha256 "55131355af07e0491476eb246f3559a504385e3ba71252bb039d5c162912b528"
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
