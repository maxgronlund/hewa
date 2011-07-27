# encoding: utf-8

# item_lang_category table
data = <<-END
1	1	Cremer og disinfiktion	2008-11-30 12:57:00
2	1	Instrumenter	2008-11-30 12:57:00
3	1	Skalpeller, skafter og blade	2008-11-30 12:57:00
4	1	Fræsere	2008-11-30 12:57:00
5	1	Ortonyxi	2008-11-30 12:57:00
6	1	File, spartler m.m.	2008-11-30 12:57:00
7	1	Sterialisationsudstyr	2008-11-30 12:57:00
8	1	Flasker og krukker m.m.	2008-11-30 12:57:00
9	1	Sårplejeartikler	2008-11-30 12:57:00
10	1	Papir, vat m.m.	2008-11-30 12:57:00
11	1	Masker, handsker m.m.	2008-11-30 12:57:00
12	1	Indlægsmaterialer	2008-11-30 12:57:00
13	1	Undervisningsmaterialer	2008-11-30 12:57:00
14	1	Aflastningsmaterialer og færdige gel-aflastninger	2008-11-30 12:57:00
15	1	Inventar	2008-11-30 12:57:00
16	1	Diagnostik	2008-11-30 12:57:00
17	1	Indlægssåler	2008-11-30 12:57:00
18	1	Pedograf, aftrykspapir og pressurestat	2008-11-30 12:57:00
19	1	Angorasokker, skohorn m.m.	2008-11-30 12:57:00
20	1	Støttestrømper	2008-11-30 12:57:00
END

titles = {}
data.split("\n").map do |line|
  category_id, language_id, category, updated_at = line.split("\t")

  titles[category_id] = category
end


# item_category table
data = <<-END
1	Varegrp06	2008-11-30 12:48:50
2	Varegrp3	2008-11-30 12:48:50
3	Varegrp2	2008-11-30 12:48:50
4	Varegrp4	2008-11-30 12:48:50
5	Varegrp07	2008-11-30 12:48:50
6	Varegrp8	2008-11-30 12:48:50
7	Varegrp21	2008-11-30 12:48:50
8	Varegrp10	2008-11-30 12:48:50
9	Varegrp11	2008-11-30 12:48:50
10	Varegrp12	2008-11-30 12:48:50
11	Varegrp13	2008-11-30 12:48:50
12	Varegrp14	2008-11-30 12:48:50
13	Varegrp15	2008-11-30 12:48:50
14	Varegrp05	2008-11-30 12:48:50
15	Varegrp1	2008-11-30 12:48:50
16	Varegrp16	2008-11-30 12:48:50
17	Varegrp17	2008-11-30 12:48:50
18	Varegrp18	2008-11-30 12:48:50
19	Varegrp19	2008-11-30 12:48:50
20	Varegrp9	2008-11-30 12:48:50
END

data.split("\n").each do |line|
  category_id, c5_desc, updated_at = line.split("\t")

  category = ProductLine.create! :c5_desc => c5_desc, :title => titles[category_id], :body => 'n/a'
end
