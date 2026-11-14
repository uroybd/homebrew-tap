class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-hook-0.6.62-aarch64-apple-darwin.tar.gz"
      sha256 "4f00a445c32220015786c15957d79ade367a6bca6a4afe63b5a31cac73e08130"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-hook-0.6.62-x86_64-apple-darwin.tar.gz"
      sha256 "06f16c9255ffa5753de9c3d7498899a1c70d92b2b70df8fb836097e8b8c51bd2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-hook-0.6.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5295f8eebf309ee992bb7ef1625d4a8e4a79fdff149861722136f2ab3ca18dca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-hook-0.6.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5185bf2d72ec67850cfbbca18dd72655f99433856720e1f923afad4bab75252"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.62/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
