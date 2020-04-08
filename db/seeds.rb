AdminUser.destroy_all
Category.destroy_all
Product.destroy_all

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end

implant = Category.create(name: "Implant")
cyberlimbs = Category.create(name: "Cyberlimbs")
cyberaudio = Category.create(name: "Cyberaudio")
cyberoptics = Category.create(name: "Cyberoptics")

Product.create([
                 {
                   name:        "Telescopics",
                   description: "Allows user to see telescopic images equivalent to a 30X scope.",
                   price:       529.99,
                   categories:  [cyberoptics]
                 },
                 {
                   name:        "Infrared",
                   description: "Allows user to see in pitch blackness, using heat emissions for image reception.",
                   price:       289.99,
                   categories:  [cyberoptics]
                 },
                 {
                   name:        "Amplified Hearing",
                   description: "This system improves hearing and sound recognition ability.",
                   price:       45.99,
                   categories:  [cyberaudio]
                 },
                 {
                   name:        "Radio Link",
                   description: "A microminiature radio transceiver, usually mounted at the base of the skull and using your fillings as the antennae. It is activated by clicking the teeth together sharply. To talk, you merely sub vocalize (mutter under your breath). Reception is carried out in one of two ways: 1) a receiver directly vibrates the mastoid bone, giving you a small tinny voice in the back of your head, or 2) linked to a cyberoptics Marquee option, incoming messages are flashed into the upper edge of your field of vision as red scrolling letters. In game terms, having a radio implant gives you the ability to talk to any receiver on the same band frequency for up to 1 mile. It also means you occasionally get someone else's radio messages. ",
                   price:       329.99,
                   categories:  [cyberaudio]
                 },
                 {
                   name:        "Extension Hand",
                   description: "This hand can extend from a telescoping wrist mount up to 1 meter. Can support up to 200 lbs.",
                   price:       89.99,
                   categories:  [cyberlimbs]
                 },
                 {
                   name:        "Standard Hand",
                   description: "This resembles a normal hand; four fingers and a thumb. The hand is covered, super-chromed, or armored as part of the arm.",
                   price:       149.99,
                   categories:  [cyberlimbs]
                 },
                 {
                   name:        "Adrenal Booster",
                   description: "An artificial gland which releases adrenal hormones on command.",
                   price:       179.99,
                   categories:  [implant]
                 },
                 {
                   name:        "Independent Air Supply",
                   description: "A small artificial organ filled with a spongy oxygen fixing foam implanted in the lower lungs it allows an inactive person to hold their breath for up to 25 minutes, or an active person up to 10 minutes.",
                   price:       549.99,
                   categories:  [implant]
                 },
                 {
                   name:        "Gill Implant",
                   description: "This implant allows the user to breath relatively clean water for up to 4 hours.",
                   price:       899.99,
                   categories:  [implant]
                 },
                 {
                   name:        "Nasal Filters",
                   description: "These filters increase resistance against poison sleepdrugs or other breathable toxins.",
                   price:       229.99,
                   categories:  [implant]
                 }
               ])

Page.create(title: "About", content: "About us...", permalink: "about")
Page.create(title: "Contact", content: "Contact us at contact@cyberwave.com", permalink: "contact")
