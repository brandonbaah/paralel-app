
clients = Client.create([{
  name: "Genevieve Harmon",
  address: "120 Broadway, New York, NY",
  user_id: 1,
  birthdate: 1979-02-11,
  phone: "718-023-4921",
  visit_today: false,
  image: "human_pic3.jpg"
  },
  {
  name: "Henley Morris",
  address: "744 Park Ave, Brooklyn, NY",
  user_id: 2,
  birthdate: "1960-07-03",
  phone: "347-223-4371",
  visit_today: false,
  image: "human_pic5.jpg"
  },
  {
  name: "Hugo Santana",
  address: "576 Flatbush Ave, Brooklyn, NY",
  user_id: 3,
  birthdate: "1980-12-06",
  phone: "917-932-1221",
  visit_today: false,
  image: "human_pic4.jpg"
},
{
  name: "Sunshine Ortez",
  address: "1050 Hancock St, Brooklyn, NY",
  user_id: 1,
  birthdate: "1979-02-11",
  phone: "718-023-4921",
  visit_today: false,
  image: "human_pic3.jpg"
  },
  {
  name: "Vivian Jeenson",
  address: "300 Madison Ave, Brooklyn, NY",
  user_id: 2,
  birthdate: "1968-22-06",
  phone: "347-223-4371",
  visit_today: false,
  image: "human_pic5.jpg"
  },
  {
  name: "Adeline John",
  address: "576 Pacific St, Brooklyn, NY",
  user_id: 3,
  birthdate: "1980-12-06",
  phone: "917-932-1221",
  visit_today: false,
  image: "human_pic4.jpg"
},
{
  name: "Javier Hueves",
  address: "98 5th Ave, New York, NY",
  user_id: 1,
  birthdate: "1950-06-11",
  phone: "718-023-4921",
  visit_today: false,
  image: "human_pic3.jpg"
  },
  {
  name: "Bruce Wayne",
  address: "3104 Newkirk Ave, Brooklyn, NY",
  user_id: 2,
  birthdate: "1943-07-03",
  phone: "347-223-4371",
  visit_today: false,
  image: "human_pic5.jpg"
  },
  {
  name: "Hugo Santana",
  address: "150 Park Ave, New York, NY",
  user_id: 3,
  birthdate: 1980-12-06,
  phone: "917-932-1221",
  visit_today: false,
  image: "human_pic4.jpg"
}])

case_notes = CaseNote.create([{
    client_id: 1,
    date: "2015-03-31",
    note: "Case Manager visited Ms. Harmon at her apartment on March 3, 2015.
          Ms. Harmon's house was full of trash and could not be recognized by home attendant.
          Ms. Harmon continues to be non-compliant with medication and service plan.
          The Case Manager continues to encourage her to see a psychologist.
          The CM will continue to monitor Ms. Harmon on a monthly basis."
  },
  {
    client_id: 1,
    date: "2015-04-29",
    note: "Case Manager visited Ms. Harmon at her apartment on April 29, 2015.
          Ms. Harmon was sleeping when the CM came to drop off her monthly funds.
          Ms. Harmon continues to be non-compliant with medication and service plan.
          The Case Manager continues to encourage her to see a psychologist.
          The CM will continue to monitor Ms. Harmon on a monthly basis."
  },
  {
    client_id: 1,
    date: "2015-05-14",
    note: "Case Manager visited Ms. Harmon at her apartment on May 14, 2015.
          Genevieve was not home but her brother told the CM that she really wanted some new summer clothes.
          Ms. Harmon continues to be non-compliant with medication and service plan.
          Her brother Robert also told the CM that she did contact a psychologist last Tuesday.
          The CM will continue to monitor Ms. Harmon on a monthly basis."
    },
  {
    client_id: 2,
    date: "2015-03-31",
    note: "Case Manager visited Mr. Henley at his apartment on March 3, 2015.
          Mr. Henley's house was full of trash and could not be recognized by home attendant.
          Mr. Henley continues to be non-compliant with medication and service plan.
          The Case Manager continues to encourage him to see a psychologist.
          The CM will continue to monitor Mr. Henley on a monthly basis."
    },
  {
    client_id: 2,
    date: "2015-04-29",
    note: "Case Manager visited Mr. Henley at his apartment on April 29, 2015.
          Mr.Henley was sleeping when the CM came to drop off his monthly funds.
          Mr. Henley continues to be non-compliant with medication and service plan.
          The Case Manager continues to encourage him to see a psychologist.
          The CM will continue to monitor Mr. Henley on a monthly basis."
    },
    {
      client_id: 2,
      date: "2015-05-14",
      note: "Case Manager visited Mr. Henley at his apartment on May 14, 2015.
            Henley was not home but his brother told the CM that he really wanted some new summer clothes.
            Mr. Henley continues to be non-compliant with medication and service plan.
            Her brother Robert also told the CM that he did contact a psychologist last Tuesday.
            The CM will continue to monitor Mr. Henley on a monthly basis."
    },
    {
      client_id: 3,
      date: "2015-03-31",
      note: "Case Manager visited Mr. Santana at her apartment on March 3, 2015.
            Mr. Santana's house was full of trash and could not be recognized by home attendant.
            Mr. Santana continues to be non-compliant with medication and service plan.
            The Case Manager continues to encourage her to see a psychologist.
            The CM will continue to monitor Mr. Santana on a monthly basis."
      },
      {
        client_id: 3,
        date: 2015-04-29,
        note: "Case Manager visited Mr. Santana at her apartment on April 29, 2015.
              Mr. Santana was sleeping when the CM came to drop off her monthly funds.
              Mr. Santana continues to be non-compliant with medication and service plan.
              The Case Manager continues to encourage his to see a psychologist.
              The CM will continue to monitor Mr. Santana on a monthly basis."
      },
      {
        client_id: 3,
        date: 2015-05-14,
        note: "Case Manager visited Mr. Santana at her apartment on May 14, 2015.
              Hugo was not home but his brother told the CM that he really wanted some new summer clothes.
              Mr. Santana continues to be non-compliant with medication and service plan.
              Her brother Robert also told the CM that he did contact a psychologist last Tuesday.
              The CM will continue to monitor Mr. Santana on a monthly basis."
        }])

users = User.create([{
    first_name: "Jordan" ,
    last_name: "Sparks",
    email: "jspark@example.com",
    role_id: 1,
    admin: false,
    supervisor_id: 2,
    director_id: 3,
    image: "user1-128x128.jpg",
    password: "password",
    password_confirmation: "password"
  },
  {
      first_name: "Elle" ,
      last_name: "Kenje",
      email: "ekenje@example.com",
      role_id: 1,
      admin: false,
      director_id: 3,
      image: "user3-128x128.jpg",
      password: "password",
      password_confirmation: "password"
    },
    {
        first_name: "Sarah" ,
        last_name: "Baah",
        email: "sbaah@example.com",
        role_id: 3,
        admin: true,
        image: "user5-128x128.jpg",
        password: "password",
        password_confirmation: "password"
      }
  ])

  roles = Role.create([{
    position: "Manager"
    },
  {
    position: "Supervisor"
    },
  {
    position: "Director"
    }])

check_lists = CheckList.create([{
    goal: "Apply for Medicaid",
    client_id: 1,
    user_id:1,
    complete:false
  },
  {
    goal: "Apply for Medicaid",
    client_id: 2,
    user_id: 2,
    complete:false
  },
  {
    goal: "Apply for Medicaid",
    client_id: 3,
    user_id: 3,
    complete:false
  },
  {
    goal: "Apply for SSI",
    client_id: 1,
    user_id: 1,
    complete:false
  },
  {
    goal: "Apply for HRA2010E",
    client_id: 2,
    user_id: 2,
    complete:false
  },
  {
    goal: "Apply for Medicare",
    client_id: 3,
    user_id: 3,
    complete:false
  }
  ])

  posts = Post.create([{
    text: "Hey!",
    activity_id: 7,
    user_id: 1,
    },
  {
    text: "Whats Up Joe!",
    activity_id: 8,
    user_id: 1,
    },
  {
    text: "I'm late on the train!!!",
    activity_id: 9,
    user_id: 1,
    }])

  activities = Activity.create([{
    event: "Client",
    recordable_id: 1,
    recordable_type: "created",
    user_id: 1
    },
  {
    event: "Client",
    recordable_id: 2,
    recordable_type: "created",
    user_id: 2
    },
  {
    event: "Client",
    recordable_id: 3,
    recordable_type: "created",
    user_id: 3
    },
    {
      event: "CheckList",
      recordable_id: 1,
      recordable_type: "updated",
      user_id: 1
      },
    {
      event: "CheckList",
      recordable_id: 2,
      recordable_type: "updated",
      user_id: 2
      },
    {
      event: "CheckList",
      recordable_id: 3,
      recordable_type: "updated",
      user_id: 3
      },
      {
        event: "Post",
        recordable_id: 1,
        recordable_type: "created",
        user_id: 1
        },
      {
        event: "Post",
        recordable_id: 2,
        recordable_type: "created",
        user_id: 2
        },
      {
        event: "Post",
        recordable_id: 3,
        recordable_type: "created",
        user_id: 3
        }])
