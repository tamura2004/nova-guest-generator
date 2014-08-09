require "./name.rb"

describe Name do

	names = [:handle,:jname,:ename,:gender]

	names.each do |name|
		it "#{name}を持つ" do
			expect(subject.send(name)).to be_a String
		end
	end

	names.each do |target|
		names.each do |name|
			if target == name || (target == :gender && name == :ename)
				it "#{target}を個別に変更できる" do
					expect{subject.send("change_#{target}")}.to change{subject.send(target)}
				end
			else
				it "#{target}の変更で#{name}が変わらない" do
					expect{subject.send("change_#{target}")}.not_to change{subject.send(name)}
				end
			end
		end
	end

	it "#inspect" do
		expect(subject.inspect).to be_a String
	end
end