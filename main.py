import tkinter as tk
from tkinter import ttk
import mysql.connector

# Connect to the database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="scoredb"
)

# Create a GUI window
window = tk.Tk()
window.title("Wushu Championship")

# Create a frame for the main menu
main_frame = ttk.Frame(window, padding="10")
main_frame.pack(fill="both", expand=True)

# Create a label and button for the main menu
label = ttk.Label(main_frame, text="Welcome To Wushu Championship!")
label.pack(pady=10)

button_frame = ttk.Frame(main_frame)
button_frame.pack(pady=10)

change_name_button = ttk.Button(button_frame, text="Change Participant's Name", command=lambda: change_name())
change_name_button.pack(side=tk.LEFT, padx=10)

evaluate_button = ttk.Button(button_frame, text="Scoring System", command=lambda: evaluate())
evaluate_button.pack(side=tk.LEFT, padx=10)

def change_name():
    # Create a new window for changing athlete names
    change_name_window = tk.Toplevel(window)
    change_name_window.title("Change Participant's Name")

    # Create a frame for the athlete list
    athlete_frame = ttk.Frame(change_name_window, padding="10")
    athlete_frame.pack(fill="both", expand=True)

    # Create a label and listbox for the athlete list
    label = ttk.Label(athlete_frame, text="Participants List:")
    label.pack(pady=10)

    # Create a scrollbar for the listbox
    scrollbar = tk.Scrollbar(athlete_frame)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

    # Create a listbox with scrollbar
    athlete_listbox = tk.Listbox(athlete_frame, width=30, yscrollcommand=scrollbar.set)
    athlete_listbox.pack(pady=10, fill="both", expand=True)

    # Configure the scrollbar
    scrollbar.config(command=athlete_listbox.yview)

    # Populate the athlete listbox
    cursor = db.cursor()
    cursor.execute("SELECT id_athlete, athlete_name FROM member")
    athletes = cursor.fetchall()
    for athlete in athletes:
        athlete_listbox.insert(tk.END, f"{athlete[0]} - {athlete[1]}")

    # Create a frame for the new name entry
    new_name_frame = ttk.Frame(change_name_window, padding="10")
    new_name_frame.pack(fill="both", expand=True)

    # Create a label and entry for the new name
    label = ttk.Label(new_name_frame, text="New Name:")
    label.pack(pady=10)

    new_name_entry = ttk.Entry(new_name_frame, width=30)
    new_name_entry.pack(pady=10)

    # Create a button to update the athlete name
    update_button = ttk.Button(new_name_frame, text="Update", command=lambda: update_athlete_name(athlete_listbox, new_name_entry))
    update_button.pack(pady=10)

def update_athlete_name(athlete_listbox, new_name_entry):
    # Get the selected athlete and new name
    selected_athlete = athlete_listbox.get(athlete_listbox.curselection())
    new_name = new_name_entry.get()

    # Update the athlete name in the database
    cursor = db.cursor()
    cursor.execute("UPDATE member SET athlete_name = %s WHERE id_athlete = %s", (new_name, selected_athlete.split(" - ")[0]))
    db.commit()

    # Close the change name window
    change_name_window.destroy()

def evaluate():
    global evaluate_window
    global mainmatch_frame
    evaluate_window = tk.Toplevel(window)
    evaluate_window.title("Scoring System")

    # Create a frame for the mainmatch information
    mainmatch_frame = ttk.Frame(evaluate_window, padding="10")
    mainmatch_frame.pack(fill="both", expand=True)

    # Create a label and label for the mainmatch information
    label = ttk.Label(mainmatch_frame, text="Main Match Information:")
    label.pack(pady=10)

    # Get the first mainmatch information
    cursor = db.cursor()
    cursor.execute("SELECT mainmatch.id_match, mainmatch.id_athlete, member.athlete_name, member.id_camp, camp.camp_name, mainmatch.id_style, style.style_name FROM mainmatch JOIN member ON mainmatch.id_athlete = member.id_athlete JOIN camp ON member.id_camp = camp.id_camp JOIN style ON mainmatch.id_style = style.id_style WHERE mainmatch.id_match = 'A001'")
    mainmatch_info = cursor.fetchone()

    mainmatch_label = ttk.Label(mainmatch_frame, text=f"Match ID: {mainmatch_info[0]}, Athlete: {mainmatch_info[2]}, Sasana: {mainmatch_info[4]}, Jurus: {mainmatch_info[6]}")
    mainmatch_label.pack(pady=10)

    # Create a frame for the referee entries
    referee_frame = ttk.Frame(evaluate_window, padding="10")
    referee_frame.pack(fill="both", expand=True)

    # Create labels and entries for the referees
    referee_labels = []
    referee_entries = []
    for i in range(5):
        label = ttk.Label(referee_frame, text=f"Wasit {i+1}:")
        label.pack(pady=5)
        referee_labels.append(label)

        entry = ttk.Entry(referee_frame, width=30)
        entry.pack(pady=5)
        referee_entries.append(entry)

    # Create a button to submit the referee scores
    submit_button = ttk.Button(referee_frame, text="Submit", command=lambda: submit_referee(mainmatch_info, referee_entries, referee_frame))
    submit_button.pack(pady=10)

def submit_referee(mainmatch_info, referee_entries, referee_frame):
    # Get the referee IDs
    referee_ids = [entry.get() for entry in referee_entries]

    # Destroy the referee frame
    referee_frame.destroy()

    # Create a frame for the score entries
    score_frame = ttk.Frame(evaluate_window, padding="10")
    score_frame.pack(fill="both", expand=True)

    # Create labels and entries for the scores
    score_labels = []
    score_entries = []
    for i in range(5):
        label = ttk.Label(score_frame, text=f"Score {i+1}:")
        label.pack(pady=5)
        score_labels.append(label)

        entry = ttk.Entry(score_frame, width=30)
        entry.pack(pady=5)
        score_entries.append(entry)

    # Create a button to submit the scores
    submit_score_button = ttk.Button(score_frame, text="Submit", command=lambda: submit_scores(mainmatch_info, referee_ids, score_entries, score_frame))
    submit_score_button.pack(pady=10)

def submit_scores(mainmatch_info, referee_ids, score_entries, score_frame):
    # Get the scores
    scores = [entry.get() for entry in score_entries]

    # Get the id_score from the score table
    cursor = db.cursor()
    cursor.execute("SELECT id_score FROM score WHERE id_match = %s", (mainmatch_info[0],))
    id_score = cursor.fetchone()[0]

    # Insert the scores into the database
    for i, score in enumerate(scores):
        cursor.execute("INSERT INTO calculation (id_calculation, id_score, id_referee, personal_score) VALUES (%s, %s, %s, %s)", (f"{mainmatch_info[0]}_{i+1}", id_score, referee_ids[i], score))
    db.commit()

    # Calculate the average score
    average_score = sum(map(float, scores)) / len(scores)

    # Update the final score in the score table
    cursor.execute("UPDATE score SET final_score = %s WHERE id_match = %s", (average_score, mainmatch_info[0]))
    db.commit()

    # Destroy the score frame
    score_frame.destroy()

    # Create a frame for the result
    global result_frame
    result_frame = ttk.Frame(evaluate_window, padding="10")
    result_frame.pack(fill="both", expand=True)

    # Create a label to display the result
    result_label = ttk.Label(result_frame, text=f"Final Score: {average_score:.2f}")
    result_label.pack(pady=10)

    # Create a label to display the mainmatch information
    mainmatch_label = ttk.Label(result_frame, text=f"Match ID: {mainmatch_info[0]}, Athlete: {mainmatch_info[2]}, Sasana: {mainmatch_info[4]}, Jurus: {mainmatch_info[6]}")
    mainmatch_label.pack(pady=10)

    # Create a button to display the next match
    next_match_button = ttk.Button(result_frame, text="Next Match", command=lambda: next_match(mainmatch_info, result_frame))
    next_match_button.pack(pady=10)

def next_match(mainmatch_info, result_frame):
    # Destroy the result frame
    result_frame.destroy()

    # Get the mainmatch frame
    global mainmatch_frame

    # Hapus semua widget di mainmatch_frame
    for widget in mainmatch_frame.winfo_children():
        widget.destroy()

    # Get the next mainmatch information
    cursor = db.cursor()
    cursor.execute("SELECT mainmatch.id_match, mainmatch.id_athlete, member.athlete_name, member.id_camp, camp.camp_name, mainmatch.id_style, style.style_name FROM mainmatch JOIN member ON mainmatch.id_athlete = member.id_athlete JOIN camp ON member.id_camp = camp.id_camp JOIN style ON mainmatch.id_style = style.id_style WHERE mainmatch.id_match > %s ORDER BY mainmatch.id_match LIMIT 1", (mainmatch_info[0],))
    next_mainmatch_info = cursor.fetchone()

    # Create a label to display the next mainmatch information
    next_mainmatch_label = ttk.Label(mainmatch_frame, text=f"Match ID: {next_mainmatch_info[0]}, Athlete: {next_mainmatch_info[2]}, Camp: {next_mainmatch_info[4]}, Style: {next_mainmatch_info[6]}")
    next_mainmatch_label.pack(pady=10)

    # Create a frame for the referee entries
    referee_frame = ttk.Frame(mainmatch_frame, padding="10")
    referee_frame.pack(fill="both", expand=True)

    # Create labels and entries for the referees
    referee_labels = []
    referee_entries = []
    for i in range(5):
        label = ttk.Label(referee_frame, text=f"Referee {i+1}:")
        label.pack(pady=5)
        referee_labels.append(label)

        entry = ttk.Entry(referee_frame, width=30)
        entry.pack(pady=5)
        referee_entries.append(entry)

    # Create a button to submit the referee scores
    submit_button = ttk.Button(referee_frame, text="Submit", command=lambda: submit_referee(next_mainmatch_info, referee_entries, referee_frame))
    submit_button.pack(pady=10)



# Start the GUI event loop
window.mainloop()