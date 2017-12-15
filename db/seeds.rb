# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

metrics_params = [
  {
    name: 'Steps',
    unit_of_measure: 'step',
    frequency: 0
  },
  {
    name: 'Workouts',
    unit_of_measure: 'time',
    frequency: 1
  },
  {
    name: 'RescueTime Score',
    unit_of_measure: nil,
    frequency: 0
  },
  {
    name: 'Todoist',
    unit_of_measure: 'task',
    frequency: 1
  },
  {
    name: 'Todo.txt',
    unit_of_measure: 'task',
    frequency: 1
  },
  {
    name: 'Meditation',
    unit_of_measure: 'minutes',
    frequency: 1
  }
]
metrics_params.each { |params| Metric.create(params) }

demerits_params = [
  { name: 'Smoking' },
  { name: 'PMO' },
  { name: 'Junk Food' },
  { name: '+3hrs of phone usage' },
  { name: '+1.5hrs of distracting time' },
  { name: 'Woke up late' },
  { name: 'Did not make bed' },
  { name: 'Missed calendar event time' },
  { name: 'Left workspace non-pristine' }
]
demerits_params.each { |params| Demerit.create(params) }

rules_params = [
  { name: 'Wake up at 7am (7:45am on weekends)', demerit: Demerit.find_by(name: 'Woke up late') },
  { name: 'Make bed', demerit: Demerit.find_by(name: 'Did not make bed') },
  { name: 'Follow calendar event times', demerit: Demerit.find_by(name: 'Missed calendar event time') },
  { name: 'Return workspace to pristine condition', demerit: Demerit.find_by(name: 'Left workspace non-pristine') }
]
rules_params.each { |params| Rule.create(params) }

step_metric       = Metric.find_by(name: 'Steps')
workout_metric    = Metric.find_by(name: 'Workouts')
rts_metric        = Metric.find_by(name: 'RescueTime Score')
todoist_metric    = Metric.find_by(name: 'Todoist')
txt_metric        = Metric.find_by(name: 'Todo.txt')
meditation_metric = Metric.find_by(name: 'Meditation')

incentives_params = [
  { metric: step_metric, merit: true, threshold: 6000, equation: '>=', coins: 2},
  { metric: step_metric, merit: true, threshold: 10000, equation: '>=', coins: 5},
  { metric: step_metric, merit: false, threshold: 5000, equation: '<', coins: 1},
  { metric: step_metric, merit: false, threshold: 3000, equation: '<', coins: 2},
  { metric: step_metric, merit: false, threshold: 2000, equation: '<', coins: 5},
  { metric: workout_metric, merit: true, threshold: 3, equation: '>=', coins: 2},
  { metric: workout_metric, merit: true, threshold: 5, equation: '>=', coins: 5},
  { metric: workout_metric, merit: true, threshold: 5, equation: '>', coins: 10},
  { metric: workout_metric, merit: false, threshold: 1, equation: '<', coins: 5},
  { metric: rts_metric, merit: true, threshold: 80, equation: '>=', coins: 1},
  { metric: rts_metric, merit: true, threshold: 85, equation: '>=', coins: 2},
  { metric: rts_metric, merit: true, threshold: 90, equation: '>=', coins: 3},
  { metric: rts_metric, merit: true, threshold: 95, equation: '>=', coins: 5},
  { metric: rts_metric, merit: true, threshold: 99, equation: '>=', coins: 10},
  { metric: rts_metric, merit: false, threshold: 65, equation: '<=', coins: 2},
  { metric: rts_metric, merit: false, threshold: 50, equation: '<=', coins: 5},
  { metric: todoist_metric, merit: true, threshold: 20, equation: '>=', coins: 2},
  { metric: todoist_metric, merit: true, threshold: 25, equation: '>=', coins: 3},
  { metric: todoist_metric, merit: true, threshold: 30, equation: '>=', coins: 5},
  { metric: todoist_metric, merit: true, threshold: 50, equation: '>=', coins: 10},
  { metric: todoist_metric, merit: false, threshold: 20, equation: '<', coins: 2},
  { metric: todoist_metric, merit: false, threshold: 10, equation: '<', coins: 5},
  { metric: todoist_metric, merit: false, threshold: 1, equation: '<=', coins: 10},
  { metric: txt_metric, merit: true, threshold: 70, equation: '>=', coins: 5},
  { metric: txt_metric, merit: true, threshold: 100, equation: '>=', coins: 10},
  { metric: txt_metric, merit: true, threshold: 150, equation: '>=', coins: 15},
  { metric: txt_metric, merit: true, threshold: 200, equation: '>=', coins: 20},
  { metric: txt_metric, merit: false, threshold: 50, equation: '<=', coins: 5},
  { metric: txt_metric, merit: false, threshold: 10, equation: '<=', coins: 10},
  { metric: meditation_metric, merit: true, threshold: 35, equation: '>=', coins: 2},
  { metric: meditation_metric, merit: true, threshold: 75, equation: '>=', coins: 5},
  { metric: meditation_metric, merit: true, threshold: 105, equation: '>=', coins: 10},
  { metric: meditation_metric, merit: true, threshold: 140, equation: '>=', coins: 15},
  { metric: meditation_metric, merit: true, threshold: 210, equation: '>=', coins: 20},
]
incentives_params.each { |params| Incentive.create(params) }
