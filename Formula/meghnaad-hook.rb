class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-hook-0.8.21-aarch64-apple-darwin.tar.gz"
      sha256 "69453e3173c651b041b202d2b67641473479fe57d116909ef74990830abec87a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-hook-0.8.21-x86_64-apple-darwin.tar.gz"
      sha256 "7966204baeb1f42ade9b555f48a15d191b808d971ba7f771d9bfae4bcd813e05"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-hook-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a6c09deac2bd3857c7f1b1f932c57a58249c5a61ba5960b280351b1dfbe7d30"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-hook-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b8cda444ec5d9db8678ac542cdbbb4512e3a217b148de247159e93b7dfe30de"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.21/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
