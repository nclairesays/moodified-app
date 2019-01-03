User.destroy_all
Mood.destroy_all
MoodLog.destroy_all
Rating.destroy_all

l1 = Rating.create(level: 1)
l2 = Rating.create(level: 2)
l3 = Rating.create(level: 3)
l4 = Rating.create(level: 4)
l5 = Rating.create(level: 5)

a = User.create(name: "Andy")
b = User.create(name: "Becky")
c = User.create(name: "Cathy")
d = User.create(name: "Daisy")
e = User.create(name: "Elly")

happy = Mood.create(name: "Happy")
sad = Mood.create(name: "Sad")
ok = Mood.create(name: "Ok")
angry = Mood.create(name: "Angry")



MoodLog.create(user: a, mood:happy, rating: l1)
MoodLog.create(user: b, mood:sad, rating: l2)
MoodLog.create(user: c, mood:ok, rating: l3)
MoodLog.create(user: d, mood:angry, rating: l4)
MoodLog.create(user: e, mood:happy, rating: l5)


#same user, same mood, diff levels
MoodLog.create(user: a, mood:angry, rating: l4)
MoodLog.create(user: b, mood:happy, rating: l5)
MoodLog.create(user: c, mood:angry, rating: l1)
MoodLog.create(user: d, mood:ok, rating: l2)
MoodLog.create(user: e, mood:sad, rating: l3)

