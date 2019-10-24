require 'git'

class Revision

def initialize
end

def tagStrip(vstrip)
vstrip.slice!(1..-1).split('.')
end


def tagDefinition(tag_array)
tag_major = tag_array[0].to_i
tag_minor = tag_array[1].to_i
tag_revision = tag_array[2].to_i
tag_revision += 1

tag_incremented = "v#{tag_major}.#{tag_minor}.#{tag_revision}"
return tag_incremented
end

def getGitTag
working_dir = Dir.pwd
gop = Git.open(working_dir)
gop.describe('HEAD', :abbrev => 0, :tags => true)
end

def setGitAdd
working_dir = Dir.pwd
gop = Git.open(working_dir)
gop.add(:all => true)
end

def setGitCommit
working_dir = Dir.pwd
gop = Git.open(working_dir)
gop.commit("Automatic version bump")
end
end

c1 = Revision.new
tag = c1.getGitTag
z = c1.tagStrip(tag)
y = c1.tagDefinition(z)

puts y