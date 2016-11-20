Problem:
--------
Navigating between pages keeps the timer going in memory, but the print out to console, the setting of label for display is no longer happening in the foreground.


Solution:
---------
Before segue, invalidate the timer and pass the data for the next controller if it cares, and let it continue the timer from there.  A class is created to encapsulate the functionality of the timer.  Let the new page conittnue the timer only if the segue happened while it is running.
