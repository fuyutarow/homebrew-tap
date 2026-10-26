class Agx < Formula
  version "1.15.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.15.0/agx-1.15.0-darwin-arm64.tar.gz"
      sha256 "f8546c8b92acb79e67122a29ae32bc9ad6859ba9d1f67e592d274ecdec5974dc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.15.0/agx-1.15.0-darwin-x64.tar.gz"
      sha256 "9c05bb45cd6291778bc8869fd152848004ef14ea22499cbd83e8d8b9dc5d27dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.15.0/agx-1.15.0-linux-arm64.tar.gz"
      sha256 "f8a324ed7a030588211150140c50a7631150338da7b62145c0bd629e9266f528"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.15.0/agx-1.15.0-linux-x64.tar.gz"
      sha256 "59d7cd96975e9d37130c9ebcf52c7e0b0e6b4f34d6cc95d29332e9f0ad6d0f07"
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
