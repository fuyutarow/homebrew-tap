class Agx < Formula
  version "1.22.59"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.59/agx-1.22.59-darwin-arm64.tar.gz"
      sha256 "73f178b562b5e3cc6d8b2e56ea4ae2520db2d615a63e3a5b83df2e8b3389be31"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.59/agx-1.22.59-darwin-x64.tar.gz"
      sha256 "189477be1d488b02f99f09552916e02abbb71e6af4c220d043d8269ff80528d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.59/agx-1.22.59-linux-arm64.tar.gz"
      sha256 "be908191c734ea980334b3861ee962f1e867946de20fbc5d7b2e2af5af9764fb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.59/agx-1.22.59-linux-x64.tar.gz"
      sha256 "a99d3fa75b4871f6e54a99faffc96d50227b26bd1d25c39c657bc2b7cfd93644"
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
