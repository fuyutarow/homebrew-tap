class Agx < Formula
  version "1.22.95"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.95/agx-1.22.95-darwin-arm64.tar.gz"
      sha256 "3d13569721dbfcd95eb2260fbcbd7773ccb3b259d470fe18301270c1b89709cb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.95/agx-1.22.95-darwin-x64.tar.gz"
      sha256 "422c65fc4fa8c8f92afbb463756550e122b9a8342fe0513cca15931dceea7fca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.95/agx-1.22.95-linux-arm64.tar.gz"
      sha256 "dd87d5bd120a006474cb55da7784041b27cca30f7b4ccfc3e1d4f1f923e8f1b9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.95/agx-1.22.95-linux-x64.tar.gz"
      sha256 "ab6e56ba34e02ce976d0ed8bd9b7d7d88f2c2725ad990405b8ef8c7eab43d56d"
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
