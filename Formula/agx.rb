class Agx < Formula
  version "1.13.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.1/agx-1.13.1-darwin-arm64.tar.gz"
      sha256 "d6c9b967954e94296483eaac6db50c8dc981820604e72603a6a30b597595e9b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.1/agx-1.13.1-darwin-x64.tar.gz"
      sha256 "2e542a73012c2446414f2d0d7cb8bf2ca2afe15bbb6a986319cad078fb5e6d26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.1/agx-1.13.1-linux-arm64.tar.gz"
      sha256 "c8a2ad56e617695020adb520968d9bc844c68f7e6ae6119097f74c8a9309fa6a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.1/agx-1.13.1-linux-x64.tar.gz"
      sha256 "c26b80272a424dd8c9a51504310d3230d461220d0b865d9b6234d9d0e49858cd"
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
