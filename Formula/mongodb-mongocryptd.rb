class MongodbMongocryptd < Formula
  desc "mongocryptd service for Client Side Encryption"
  homepage "https://www.mongodb.com/"

  if Hardware::CPU.intel?
    url "https://downloads.mongodb.com/osx/mongodb-cryptd-macos-x86_64-enterprise-9.0.2.tgz"
    sha256 "3749edce385ea4a0d9a9a867c68140795ab93bc38649b587c031169329a96fd3"
  else
    url "https://downloads.mongodb.com/osx/mongodb-cryptd-macos-arm64-enterprise-9.0.2.tgz"
    sha256 "1a17ff9a8fbcaca571e14a81910cbb99d3c538d37ce5697d2c03612867bd3519"
  end
  license "MongoDB Customer Agreement"

  def caveats
    <<~EOS
      mongocryptd is licensed under the MongoDB Customer Agreement (https://www.mongodb.com/customer-agreement). Except for evaluation purposes, you may not use mongocryptd without a commercial license from MongoDB.
    EOS
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/mongocryptd", "--version"
  end
end
