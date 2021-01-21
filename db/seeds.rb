User.create([
  {name: "Robin DaBank", email:"robindabank@email.com", password:123456},
  {name: "Collin DaCops", email:"collindacops@email.com", password:123456},
  {name: "JOTARO", email:"jotaro@email.com", password:123456},
  {name: "DIO", email:"dio@email.com", password:123456},
  {name: "ベジータ", email:"vegeta@email.com", password:123456},
  {name: "悟空", email:"goku@email.com", password:123456},
  {name: "ベジット", email:"vegito@email.com", password:123456}
])

Post.create([
  {body: "Going to the bank Tomorrow", user_id:1},
  {body: "よこせ!歯茎!!", user_id:5},
  {body: "サンキューベジータ!!!", user_id:6},
  {body: "よっしゃーっ!!!", user_id:7},
  {body: "次はJOTARO!\n貴様だ.", user_id:4}
])

Comment.create([
  {body: "I'll be there", user_id:2, post_id:1},
  {body: "野郎… DIO!", user_id:3, post_id:5},
  {body: "ほう…向かってくるのか……", user_id:4, post_id:5},
  {body: "逃げずにこのDIOに近づいてくるのか……", user_id:4, post_id:5},
  {body: "せっかく祖父のジョセフが私の「ザ・ワールド」の正体を試験終了チャイム直前まで問題を解いてる受験生のような必死こいた気分で教えてくれたというのに……", user_id:4, post_id:5},
  {body: "近づかなきゃてめーをブチのめせないんでな……", user_id:3, post_id:5},
  {body: "ほほお〜〜〜っ", user_id:4, post_id:5},
  {body: "では十分近づくがよい", user_id:4, post_id:5}
])

Like.create([
  {user_id:1, post_id:1},
  {user_id:2, post_id:1},
  {user_id:6, post_id:2},
  {user_id:5, post_id:3},
  {user_id:7, post_id:4},
  {user_id:6, post_id:4},
  {user_id:5, post_id:4},
  {user_id:4, post_id:5},
  {user_id:3, post_id:5},
])

Friendship.create([
  {person_id:1, friend_id:2},
  {person_id:2, friend_id:1},
  {person_id:4, friend_id:3},
  {person_id:3, friend_id:4},
  {person_id:6, friend_id:5},
  {person_id:5, friend_id:6},
  {person_id:6, friend_id:7},
  {person_id:7, friend_id:6},
  {person_id:5, friend_id:7},
  {person_id:7, friend_id:5}
])