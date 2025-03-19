import React from 'react'

const HowItWorksSections = () => {
  return (
    <section id='how-it-works' className='bg-gray-50 py-20 dark:bg-neutral-900'>
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-purple-100 px-3 py-1 text-sm font-semibold text-purple-800 dark:bg-purple-900/30 dark:text-purple-300'>
            Simple Process
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            How EduLearn Works
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Follow these simple steps to get started with our app
          </p>
        </div>

        <div className='mx-auto max-w-6xl'>
          <div className='grid gap-8 md:grid-cols-3'>
            <div className='animate__animated animate__fadeInUp group relative'>
              <div className='absolute right-0 top-16 hidden h-1 w-full translate-x-1/2 border-t-2 border-dashed border-indigo-300 dark:border-indigo-700 md:block'></div>

              <div className='relative z-10 overflow-hidden rounded-2xl bg-white p-8 shadow-lg transition-transform duration-300 hover:-translate-y-2 dark:bg-neutral-800'>
                <div className='mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-indigo-100 text-2xl font-bold text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'>
                  1
                </div>
                <h3 className='mb-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Sign Up &amp; Select Subjects
                </h3>
                <p className='text-gray-600 dark:text-gray-400'>
                  Register using your mobile number and select your class and
                  preferred subjects to get started.
                </p>

                <div className='mt-6 space-y-3'>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Quick mobile number registration</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Choose your class (9th, 10th, etc.)</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Select your preferred subjects</span>
                  </div>
                </div>

                <div className='mt-8 flex justify-center md:hidden'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-indigo-500'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M19 14l-7 7m0 0l-7-7m7 7V3'
                    ></path>
                  </svg>
                </div>
              </div>
            </div>

            <div className='animate__animated animate__fadeInUp animate__delay-1s group relative'>
              <div className='absolute right-0 top-16 hidden h-1 w-full translate-x-1/2 border-t-2 border-dashed border-indigo-300 dark:border-indigo-700 md:block'></div>

              <div className='relative z-10 overflow-hidden rounded-2xl bg-white p-8 shadow-lg transition-transform duration-300 hover:-translate-y-2 dark:bg-neutral-800'>
                <div className='mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-purple-100 text-2xl font-bold text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                  2
                </div>
                <h3 className='mb-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Explore &amp; Learn
                </h3>
                <p className='text-gray-600 dark:text-gray-400'>
                  Access study materials, create chapters, ask questions, and
                  connect with peers to enhance your learning.
                </p>

                <div className='mt-6 space-y-3'>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Browse subject materials by chapter</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Ask questions &amp; get answers</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Connect with fellow students</span>
                  </div>
                </div>

                <div className='mt-8 flex justify-center md:hidden'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-indigo-500'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M19 14l-7 7m0 0l-7-7m7 7V3'
                    ></path>
                  </svg>
                </div>
              </div>
            </div>

            <div className='animate__animated animate__fadeInUp animate__delay-2s group relative'>
              <div className='relative z-10 overflow-hidden rounded-2xl bg-white p-8 shadow-lg transition-transform duration-300 hover:-translate-y-2 dark:bg-neutral-800'>
                <div className='mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-teal-100 text-2xl font-bold text-teal-600 dark:bg-teal-900/30 dark:text-teal-400'>
                  3
                </div>
                <h3 className='mb-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Test &amp; Challenge
                </h3>
                <p className='text-gray-600 dark:text-gray-400'>
                  Take MCQ-based tests, create custom exams, and challenge
                  friends to see who performs better.
                </p>

                <div className='mt-6 space-y-3'>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Create custom MCQ exams</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Track performance with detailed results</span>
                  </div>
                  <div className='flex items-center space-x-3 text-sm text-gray-600 dark:text-gray-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 flex-shrink-0 text-green-500'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                    <span>Challenge friends to friendly competitions</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mt-20 rounded-3xl bg-white p-6 shadow-xl dark:bg-neutral-800 lg:p-8'>
          <div className='grid gap-10 md:grid-cols-2'>
            <div className='flex flex-col justify-center'>
              <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                See It In Action
              </h3>
              <p className='mt-4 text-lg text-gray-600 dark:text-gray-300'>
                Watch how easily you can navigate through the app and make the
                most of its features.
              </p>

              <div className='mt-8 space-y-6'>
                <div className='relative overflow-hidden rounded-lg border border-gray-200 bg-gray-50 p-4 pl-12 transition-all duration-300 hover:border-indigo-300 hover:shadow-md dark:border-gray-700 dark:bg-gray-900 dark:hover:border-indigo-700'>
                  <div className='absolute left-4 top-4 flex h-6 w-6 items-center justify-center rounded-full bg-indigo-100 text-indigo-600 dark:bg-indigo-900/50 dark:text-indigo-400'>
                    <span className='text-sm font-bold'>1</span>
                  </div>
                  <h4 className='font-medium text-gray-900 dark:text-white'>
                    Quick Subject Navigation
                  </h4>
                  <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                    Navigate between subjects with a simple tap and access your
                    study materials instantly.
                  </p>
                </div>

                <div className='relative overflow-hidden rounded-lg border border-gray-200 bg-gray-50 p-4 pl-12 transition-all duration-300 hover:border-purple-300 hover:shadow-md dark:border-gray-700 dark:bg-gray-900 dark:hover:border-purple-700'>
                  <div className='absolute left-4 top-4 flex h-6 w-6 items-center justify-center rounded-full bg-purple-100 text-purple-600 dark:bg-purple-900/50 dark:text-purple-400'>
                    <span className='text-sm font-bold'>2</span>
                  </div>
                  <h4 className='font-medium text-gray-900 dark:text-white'>
                    Intuitive Q&amp;A Interface
                  </h4>
                  <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                    Ask questions and receive answers from peers and experts
                    with our simple interface.
                  </p>
                </div>

                <div className='relative overflow-hidden rounded-lg border border-gray-200 bg-gray-50 p-4 pl-12 transition-all duration-300 hover:border-teal-300 hover:shadow-md dark:border-gray-700 dark:bg-gray-900 dark:hover:border-teal-700'>
                  <div className='absolute left-4 top-4 flex h-6 w-6 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-900/50 dark:text-teal-400'>
                    <span className='text-sm font-bold'>3</span>
                  </div>
                  <h4 className='font-medium text-gray-900 dark:text-white'>
                    Easy Exam Creation
                  </h4>
                  <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                    Create custom exams by selecting subject, topic, number of
                    questions, and duration with just a few taps.
                  </p>
                </div>
              </div>
            </div>

            <div className='relative flex items-center justify-center lg:justify-end'>
              <div className='relative mx-auto w-full max-w-[320px]'>
                <div className='relative rounded-[3rem] border-[14px] border-gray-800 bg-gray-800 shadow-xl dark:border-gray-700'>
                  <div className='aspect-[9/19] overflow-hidden rounded-[2.3rem] bg-white dark:bg-gray-800'>
                    <div className='relative h-full w-full'>
                      <div className='bg-indigo-600 px-4 py-6 text-white'>
                        <div className='flex items-center justify-between'>
                          <div className='flex items-center'>
                            <button className='mr-2 rounded-full bg-white/10 p-1'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                            <h3 className='text-lg font-semibold'>
                              Create Exam
                            </h3>
                          </div>
                          <button className='rounded-full bg-white/10 p-1'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-5 w-5'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                          </button>
                        </div>
                      </div>

                      <div className='p-4'>
                        <div className='space-y-4'>
                          <div>
                            <label className='mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300'>
                              Subject
                            </label>
                            <div className='relative'>
                              <select className='w-full appearance-none rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-700 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white'>
                                <option>Mathematics</option>
                                <option>Science</option>
                                <option>English</option>
                                <option>Social Studies</option>
                              </select>
                              <div className='pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700'>
                                <svg
                                  className='h-4 w-4 fill-current'
                                  xmlns='http://www.w3.org/2000/svg'
                                  viewBox='0 0 20 20'
                                >
                                  <path
                                    fill-rule='evenodd'
                                    d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z'
                                    clip-rule='evenodd'
                                  ></path>
                                </svg>
                              </div>
                            </div>
                          </div>

                          <div>
                            <label className='mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300'>
                              Topic
                            </label>
                            <div className='relative'>
                              <select className='w-full appearance-none rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-700 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white'>
                                <option>Algebra</option>
                                <option>Geometry</option>
                                <option>Trigonometry</option>
                                <option>Calculus</option>
                              </select>
                              <div className='pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700'>
                                <svg
                                  className='h-4 w-4 fill-current'
                                  xmlns='http://www.w3.org/2000/svg'
                                  viewBox='0 0 20 20'
                                >
                                  <path
                                    fill-rule='evenodd'
                                    d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z'
                                    clip-rule='evenodd'
                                  ></path>
                                </svg>
                              </div>
                            </div>
                          </div>

                          <div>
                            <div className='flex items-center justify-between'>
                              <label className='block text-sm font-medium text-gray-700 dark:text-gray-300'>
                                Number of Questions
                              </label>
                              <span className='text-sm font-medium text-indigo-600 dark:text-indigo-400'>
                                15
                              </span>
                            </div>
                            <input
                              type='range'
                              min='5'
                              max='50'
                              value='15'
                              className='mt-2 h-2 w-full cursor-pointer appearance-none rounded-lg bg-gray-200 dark:bg-gray-700'
                            />
                            <div className='mt-1 flex justify-between text-xs text-gray-500 dark:text-gray-400'>
                              <span>5</span>
                              <span>50</span>
                            </div>
                          </div>

                          <div>
                            <div className='flex items-center justify-between'>
                              <label className='block text-sm font-medium text-gray-700 dark:text-gray-300'>
                                Duration (minutes)
                              </label>
                              <span className='text-sm font-medium text-indigo-600 dark:text-indigo-400'>
                                30
                              </span>
                            </div>
                            <input
                              type='range'
                              min='5'
                              max='120'
                              value='30'
                              className='mt-2 h-2 w-full cursor-pointer appearance-none rounded-lg bg-gray-200 dark:bg-gray-700'
                            />
                            <div className='mt-1 flex justify-between text-xs text-gray-500 dark:text-gray-400'>
                              <span>5</span>
                              <span>120</span>
                            </div>
                          </div>

                          <div>
                            <label className='mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300'>
                              Difficulty Level
                            </label>
                            <div className='flex space-x-2'>
                              <button className='flex-1 rounded-lg border border-gray-300 bg-white px-3 py-2 text-xs font-medium text-gray-600 shadow-sm hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'>
                                Easy
                              </button>
                              <button className='flex-1 rounded-lg border-0 bg-indigo-600 px-3 py-2 text-xs font-medium text-white shadow-sm hover:bg-indigo-700'>
                                Medium
                              </button>
                              <button className='flex-1 rounded-lg border border-gray-300 bg-white px-3 py-2 text-xs font-medium text-gray-600 shadow-sm hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'>
                                Hard
                              </button>
                            </div>
                          </div>
                        </div>

                        <div className='mt-6 grid grid-cols-2 gap-3'>
                          <button className='animate__animated animate__pulse animate__infinite animate__slow rounded-lg bg-indigo-600 px-3 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700'>
                            Generate Exam
                          </button>
                          <button className='rounded-lg border border-gray-300 px-3 py-2 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-800'>
                            Save as Draft
                          </button>
                        </div>
                      </div>

                      <div className='absolute bottom-0 left-0 right-0 flex justify-around border-t border-gray-200 bg-white py-2 dark:border-gray-700 dark:bg-gray-800'>
                        <button className='flex flex-col items-center px-3 py-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z'></path>
                          </svg>
                          <span className='mt-1 text-[10px] text-gray-500'>
                            Home
                          </span>
                        </button>
                        <button className='flex flex-col items-center px-3 py-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z'></path>
                          </svg>
                          <span className='mt-1 text-[10px] text-gray-500'>
                            Subjects
                          </span>
                        </button>
                        <button className='flex flex-col items-center px-3 py-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-indigo-600'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M9 2a1 1 0 000 2h2a1 1 0 100-2H9z'></path>
                            <path
                              fill-rule='evenodd'
                              d='M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z'
                              clip-rule='evenodd'
                            ></path>
                          </svg>
                          <span className='mt-1 text-[10px] text-indigo-600'>
                            Exams
                          </span>
                        </button>
                        <button className='flex flex-col items-center px-3 py-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fill-rule='evenodd'
                              d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                              clip-rule='evenodd'
                            ></path>
                          </svg>
                          <span className='mt-1 text-[10px] text-gray-500'>
                            Profile
                          </span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                <div className='absolute -bottom-4 -right-4 h-20 w-20 rounded-full bg-pink-400 opacity-70 blur-2xl'></div>
                <div className='absolute -left-10 top-1/3 h-24 w-24 rounded-full bg-purple-400 opacity-70 blur-3xl'></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='mt-20'>
        <svg
          xmlns='http://www.w3.org/2000/svg'
          viewBox='0 0 1440 100'
          className='fill-white dark:fill-neutral-800'
        >
          <path d='M0,50 C150,120 350,0 500,80 C650,160 800,30 1000,80 C1150,120 1350,50 1440,20 L1440,100 L0,100 Z'></path>
        </svg>
      </div>
    </section>
  )
}

export default HowItWorksSections
