class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-hook-0.8.75-aarch64-apple-darwin.tar.gz"
      sha256 "8821ff22315edbd48b5f8ecd63ead86555b929f8bddf11c8982ab00cb6e24422"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-hook-0.8.75-x86_64-apple-darwin.tar.gz"
      sha256 "33a655c8cbf3ddb979966004c7c0c07623bf1d539767bc56f6c37162bceca730"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-hook-0.8.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cbeb2a17dbcd625c16a619199989e4aaa8853ee1908b5d43416571a39a25b59"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-hook-0.8.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01bdcace66cbefbfb7a1275234a5655816e54879f3dc5a6c1a51b874eb105817"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.75/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
