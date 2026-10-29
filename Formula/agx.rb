class Agx < Formula
  version "1.22.19"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.19/agx-1.22.19-darwin-arm64.tar.gz"
      sha256 "57b4853edbde3057235ddd4aec70aaf75a7ae3732a68b610e2ae877cfadce2f3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.19/agx-1.22.19-darwin-x64.tar.gz"
      sha256 "4c1e61a192de10a44d28628862bc4a903fc46766563da8ecb306425eabd0dde5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.19/agx-1.22.19-linux-arm64.tar.gz"
      sha256 "c406773ac82270d8a8ad62eb1d24a06bc3656bc4dc182133f00841803afff2cf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.19/agx-1.22.19-linux-x64.tar.gz"
      sha256 "183574610536096268a747cd94c1ba2a673ac4980855fdd7806435780ab4f0a5"
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
