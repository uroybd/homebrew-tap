class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-hook-0.8.27-aarch64-apple-darwin.tar.gz"
      sha256 "f1852af8af54abf9cbd50c452e62dabf29fae25e14aab84f089aace76a8ba0b8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-hook-0.8.27-x86_64-apple-darwin.tar.gz"
      sha256 "0eedcf27e80facd4e347914c055ddbc461d96396fbeaf489355db45d959a1ae5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-hook-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c63e7f86d43cdc414030d71549ab7e73c2f1ee58fe6d81d68ca6e8f7bc4b9387"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-hook-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cd83e0cccd66c4fe67fab0f2e14e71fdc5962d3cd264c52eb61ff79602f4b6c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.27/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
