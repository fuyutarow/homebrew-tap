class Agx < Formula
  version "11.1.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.1/agx-11.1.1-darwin-arm64.tar.gz"
      sha256 "a668568d7396ee6244e7b6e296b48adf8843e191e60f18b3b845118d3afa7308"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.1/agx-11.1.1-darwin-x64.tar.gz"
      sha256 "09ffd241afc601d1c5a61da3d81d7807f7880420a60ea60f6227e3cf5f67dac6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.1/agx-11.1.1-linux-arm64.tar.gz"
      sha256 "b0f56cb1f06689ac8b26609a640bae2963707331d1c87e9ea3ec11b8ec8ae3ac"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.1/agx-11.1.1-linux-x64.tar.gz"
      sha256 "a88c354bc5996c2607e63bb76d0fc2097349fc2b7f91f3e3404ac45a8e761664"
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
