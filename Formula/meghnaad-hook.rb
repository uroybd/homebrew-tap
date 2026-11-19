class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-hook-0.8.17-aarch64-apple-darwin.tar.gz"
      sha256 "bdff5a6242b51c197d9cfe4d8cad212d83c14a16121cb10bfcdc3de2de77475c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-hook-0.8.17-x86_64-apple-darwin.tar.gz"
      sha256 "990189aa02b6a983de0e377d2b8c295c6247c23594a5f1c71c6928f93d8dd717"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-hook-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "922641ef2426b723920ed929d1dbd63832351f723de857fd6ee84016050d08b0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-hook-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b584cb728c3419cf7012c81d0df7607e3b0e47ac5dbc820eef65ae2ee9412b06"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.17/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
