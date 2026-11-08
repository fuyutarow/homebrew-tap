class Agx < Formula
  version "9.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v9.0.0/agx-9.0.0-darwin-arm64.tar.gz"
      sha256 "99b9de02130dccc6042748254f683aabb1070526826f0ce1164c5ce85e80f2ae"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v9.0.0/agx-9.0.0-darwin-x64.tar.gz"
      sha256 "eb22f15e9f2ec1b2bdb5b34d8dc94404eb5299fc88c96a2329ae78049cbf15cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v9.0.0/agx-9.0.0-linux-arm64.tar.gz"
      sha256 "7a3ceb6d4e194a137e970792f70199e44982756f0de57540f8293389956489b4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v9.0.0/agx-9.0.0-linux-x64.tar.gz"
      sha256 "7343bf3956dd8f80b63045d1c9e88f4854bf6d80804208d0137b8aa18b02a0b0"
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
