class Agx < Formula
  version "1.22.23"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.23/agx-1.22.23-darwin-arm64.tar.gz"
      sha256 "4c5c62471b7c3f40c09db73958ae3761dbb2e913d00d1fa49917126bc40c418f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.23/agx-1.22.23-darwin-x64.tar.gz"
      sha256 "dc413915ae4636529d8c742c6f86f1c16938655819f018294bb8dcc0d01b3f5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.23/agx-1.22.23-linux-arm64.tar.gz"
      sha256 "de192b31dde53866061eb400a0b1e2adc9870f5d543596eedd4c91ef7ca074af"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.23/agx-1.22.23-linux-x64.tar.gz"
      sha256 "68f8692cce331d09af3791876e969494401b6873bd51c176d9a62cd66a9db40b"
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
